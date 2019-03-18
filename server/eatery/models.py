from django.db import models


# Create your models here.

class MenuItem(models.Model):
    dish = models.ForeignKey('dish.Dish', on_delete=models.CASCADE)
    price = models.IntegerField('Цена', default=0)
    portion = models.CharField('Граммовка', max_length=64, default='0')
    net_weight = models.FloatField('Масса нетто', default=0)
    category = models.ManyToManyField('DishCategory', blank=True)

    class Meta:
        verbose_name = 'Пункт меню'
        verbose_name_plural = 'Пункты меню'


class DishCategory(models.Model):
    name = models.CharField('Название категории', max_length=128)
    slug = models.CharField('slug', max_length=64)

    class Meta:
        verbose_name = 'Категория блюд'
        verbose_name_plural = 'Категории блюд'


class WorkingDay(models.Model):
    name = models.CharField('День недели', max_length=64)
    slug = models.CharField('slug', max_length=8)
    open_time = models.TimeField('Время открытия')
    close_time = models.TimeField('Время закрытия')

    class Meta:
        verbose_name = 'День работы столовой'
        verbose_name_plural = 'Дни работы столовой'


class DiningRoom(models.Model):
    name = models.CharField('Название столовой', max_length=128)
    slug = models.CharField('slug', max_length=64)
    schedule = models.ForeignKey('WorkingDay', on_delete=models.CASCADE)
    description = models.CharField('Описание столовой', max_length=512, default='')

    class Meta:
        verbose_name = 'Столовая'
        verbose_name_plural = 'Столовые'
