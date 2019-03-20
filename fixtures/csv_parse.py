"""
Скрипт для заполнения БД.
Создает 7 дней недели, парсит .csv файлы с меню столовой на каждый день,
добавляет все найденные категории блюд и блюда в меню.
Столовая со слагом DINING_ROOM_SLUG должна быть создана отдельно!
"""
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
DINING_ROOM_SLUG = 'dining-room'

CSV_FILES = [
    { 'slug': 'mon', 'name': 'Понедельник' },
    { 'slug': 'tue', 'name': 'Вторник' },
    { 'slug': 'wed', 'name': 'Среда' },
    { 'slug': 'thu', 'name': 'Четверг' },
    { 'slug': 'fri', 'name': 'Пятница' },
    { 'slug': 'sat', 'name': 'Суббота' },
    { 'slug': 'sun', 'name': 'Воскресенье' },
]

Dish = apps.get_model('dish', 'Dish')
DishCategory = apps.get_model('eatery', 'DishCategory')
MenuItem = apps.get_model('eatery', 'MenuItem')
DiningRoomMenu = apps.get_model('eatery', 'DiningRoomMenu')
DiningRoom = apps.get_model('eatery', 'DiningRoom')
WeekDay = apps.get_model('eatery', 'WeekDay')

for weekday_raw in CSV_FILES:
    slug = weekday_raw['slug']
    filename = weekday_raw['name']

    weekday, created = WeekDay.objects.get_or_create(day=slug)
    PATH = os.path.join(os.path.dirname(settings.BASE_DIR), f'fixtures/{filename}.csv')

    with open(PATH) as csvfile:
        raw_data = list(csv.reader(csvfile))[NUMBER_OF_FIRST_STRING:NUMBER_OF_LAST_STRING]
        menu_items = []
        category = ''
        for item in raw_data:
            if item[1]:
                dish, created = Dish.objects.get_or_create(
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
                category, created = DishCategory.objects.get_or_create(
                    name=item[0],
                    slug=translit(item[0].lower().replace(' ', '-'), reversed=True),
                )
        menu = DiningRoomMenu.objects.create(
            dining_room=DiningRoom.objects.get(slug=DINING_ROOM_SLUG),
        )
        menu.weekday.set([weekday])
        menu.dishes.add(*menu_items)
