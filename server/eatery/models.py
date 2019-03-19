from django.db import models
from datetime import time, datetime
import itertools


# Create your models here.


class MenuItem(models.Model):
    dish = models.ForeignKey('dish.Dish', verbose_name='Блюдо', on_delete=models.CASCADE)
    price = models.IntegerField('Цена', default=0)
    portion = models.CharField('Граммовка', max_length=64, default='0')
    net_weight = models.FloatField('Масса нетто', default=0)
    category = models.ForeignKey(
        'DishCategory',
        verbose_name='Категория',
        on_delete=models.CASCADE,
    )

    def __str__(self):
        return str(self.dish)

    class Meta:
        verbose_name = 'Пункт меню'
        verbose_name_plural = 'Пункты меню'

    def to_dict(self):
        return {
            "id": self.id,
            "name": self.dish.name,
            "price": self.price / 100,
            "portion": self.portion,
            "netWeight": self.net_weight,
            "proteins": self.dish.proteins * self.net_weight / 100,
            "fats": self.dish.fats * self.net_weight / 100,
            "carbohydrates": self.dish.carbohydrates * self.net_weight / 100,
            "calorific": self.dish.calorific / 1000
        }


class DishCategory(models.Model):
    name = models.CharField('Название категории', max_length=128)
    slug = models.CharField('slug', max_length=64, unique=True)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'Категория блюд'
        verbose_name_plural = 'Категории блюд'

    def to_dict(self):
        return {
            'id': self.id,
            'slug': self.slug,
            'name': self.name
        }


class HoliDay(models.Model):
    day = models.DateField(verbose_name='дата выходного дня')

    def __str__(self):
        return str(self.day)

    class Meta:
        verbose_name = 'Выходной день'
        verbose_name_plural = 'Выходные дни'


class Shedule(models.Model):
    holidays = models.ManyToManyField(HoliDay, verbose_name='Выходные', blank=True)

    def __str__(self):
        return f'Расписание {self.pk} {self.get_open_time()}'

    def get_open_time(self):
        for holiday in self.holidays.all():
            if datetime.today().date() == holiday.day:
                return 0
        weekday = datetime.today().weekday()
        open = getattr(self, f'{DAY_NAMES[weekday][0]}_open')
        close = getattr(self, f'{DAY_NAMES[weekday][0]}_close')
        print(open, close)
        return open, close

    class Meta:
        verbose_name = 'Расписание работы'
        verbose_name_plural = 'Расписания работы'


# добавим поля времени открытия и закрытия по дням недели
DAY_NAMES = (
    ('mon', 'Понедельник'),
    ('tue', 'Вторник'),
    ('wed', 'Среда'),
    ('thu', 'Четверг'),
    ('fri', 'Пятница'),
    ('sat', 'Суббота'),
    ('sun', 'Воскресенье')
)
for day, day_name in DAY_NAMES:
    Shedule.add_to_class(f'{day}_open', models.TimeField(verbose_name=f'{day_name} - открытие', default=time(0, 0)))
    Shedule.add_to_class(f'{day}_close', models.TimeField(verbose_name=f'{day_name} - закрытие', default=time(0, 0)))


class DiningRoom(models.Model):
    name = models.CharField('Название столовой', max_length=128)
    slug = models.CharField('slug', max_length=64, unique=True)
    schedule = models.ForeignKey('Shedule', verbose_name='Расписание', on_delete=models.CASCADE)
    description = models.CharField('Описание столовой', max_length=512, default='')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'Столовая'
        verbose_name_plural = 'Столовые'


class WeekDay(models.Model):
    day = models.CharField(
        choices=DAY_NAMES,
        max_length=3,
        verbose_name='День недели',
        default='',
    )

    def __str__(self):
        return self.get_day_display()

    class Meta:
        verbose_name = 'День недели'
        verbose_name_plural = 'Дни недели'


class DiningRoomMenu(models.Model):
    """
    Mодель меню для заведения
    """
    dining_room = models.ForeignKey(
        DiningRoom,
        verbose_name='Заведение',
        on_delete=models.CASCADE,
        null=True,
    )
    weekday = models.ManyToManyField(
        WeekDay
    )
    dishes = models.ManyToManyField(
        MenuItem,
        verbose_name='Блюда',
    )

    def __str__(self):
        weekday_list = map(str, list(self.weekday.all()))
        return f'{self.dining_room} ({", ".join(weekday_list)})'

    class Meta:
        verbose_name = 'Меню'
        verbose_name_plural = 'Меню'

    def get_menu(self):
        grouped_dishes = itertools.groupby(
            self.dishes.all().order_by('category__slug'),
            key=lambda dish: dish.category and dish.category.slug
        )
        menu = []
        for key, group in grouped_dishes:
            dishes = []
            for dish in group:
                dishes.append(dish.to_dict())
            menu.append({**dish.category.to_dict(), **{'dishes': dishes}})
