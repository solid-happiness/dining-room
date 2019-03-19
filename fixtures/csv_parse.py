import csv
import random
import re
import os
from functools import reduce
from django.conf import settings
from django.apps import apps
from transliterate import translit

NUMBER_OF_FIRST_STRING = 3
NUMBER_OF_LAST_STRING = -1
DINING_ROOM_SLUG = 'dining-room-1'

CSV_FILES = [
    'Понедельник',
    'Вторник',
    'Среда',
    'Четверг',
    'Пятница',
    'Суббота',
]

Dish = apps.get_model('dish', 'Dish')
DishCategory = apps.get_model('eatery', 'DishCategory')
MenuItem = apps.get_model('eatery', 'MenuItem')
DiningRoomMenu = apps.get_model('eatery', 'DiningRoomMenu')
DiningRoom = apps.get_model('eatery', 'DiningRoom')
WeekDay = apps.get_model('eatery', 'WeekDay')

for iter, filename in enumerate(CSV_FILES):
    PATH = os.path.join(os.path.dirname(settings.BASE_DIR), f'fixtures/{filename}.csv')
    with open(PATH) as csvfile:
        raw_data = list(csv.reader(csvfile))[NUMBER_OF_FIRST_STRING:NUMBER_OF_LAST_STRING]
        menu_items = []
        category = ''
        for item in raw_data:
            if item[1]:
                # dishes.append({
                #     "name": item[1],
                #     "proteins": round(random.uniform(1, 15), 1),
                #     "fats": round(random.uniform(1, 15), 1),
                #     "carbohydrates": round(random.uniform(1, 15), 1),
                #     "calorific": random.randint(5000, 200000),
                #     "category": category,
                #     "price": float(item[2]),
                #     "portion": item[0],
                #     "net_weight": reduce(lambda x, y: float(x) + float(y), re.findall(r'\d+', item[0])),
                # })
                dish = Dish.objects.create(
                    name=item[1], proteins=round(random.uniform(1, 15), 1), fats=round(random.uniform(1, 15), 1),
                    carbohydrates=round(random.uniform(1, 15), 1), calorific=random.randint(5000, 200000)
                )
                menu_item = MenuItem.objects.create(
                    dish=dish, price=float(item[2]), portion=item[0],
                    net_weight=reduce(lambda x, y: float(x) + float(y), re.findall(r'\d+', item[0])),
                    category=category,
                )
                menu_items.append(menu_item)
            else:
                category = DishCategory.objects.get_or_create(
                    name=item[0],
                    slug=translit(item[0].lower().replace(' ', '-'), reversed=True),
                )
        menu = DiningRoomMenu.objects.create(
            dining_room=DiningRoom.objects.get(slug=DINING_ROOM_SLUG),
        )
        menu.weekday.set([WeekDay.objects.get(pk=iter + 1)])
        menu.dishes.add(*menu_items)
