from django.db import models
from datetime import time

# Create your models here.


class MenuItem(models.Model):
    dish = models.ForeignKey('dish.Dish', verbose_name='Блюдо', on_delete=models.CASCADE)
    price = models.IntegerField('Цена', default=0)
    portion = models.CharField('Граммовка', max_length=64, default='0')
    net_weight = models.FloatField('Масса нетто', default=0)
    category = models.ForeignKey('DishCategory', verbose_name='Категория', on_delete=models.SET_NULL, null=True, blank=True)

    def __str__(self):
        return self.dish.__str__()

    class Meta:
        verbose_name = 'Пункт меню'
        verbose_name_plural = 'Пункты меню'


class DishCategory(models.Model):
    name = models.CharField('Название категории', max_length=128)
    slug = models.CharField('slug', max_length=64)

    class Meta:
        verbose_name = 'Категория блюд'
        verbose_name_plural = 'Категории блюд'


class HoliDay(models.Model):
    day = models.DateField(verbose_name='дата выходного дня')

    def __str__(self):
        return f'{self.day}'

    class Meta:
        verbose_name = 'Выходной день'
        verbose_name_plural = 'Выходные дни'


class Shedule(models.Model):
    holidays = models.ManyToManyField(HoliDay, verbose_name='Выходные')

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
    slug = models.CharField('slug', max_length=64)
    schedule = models.ForeignKey('Shedule',verbose_name='Расписание', on_delete=models.CASCADE)
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


# модель меню для заведения
class DindingRoomMenu(models.Model):
    dinding_room = models.ForeignKey(
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
        return self.dinding_room.__str__()

    class Meta:
        verbose_name = 'Меню'
        verbose_name_plural = 'Меню'
