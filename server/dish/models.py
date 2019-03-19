from django.db import models


# Create your models here.


class Dish(models.Model):
    name = models.CharField('Название блюда', max_length=512)
    proteins = models.FloatField('Белки (на 100г.)', default=0)
    fats = models.FloatField('Жиры (на 100г.)', default=0)
    carbohydrates = models.FloatField('Углеводы (на 100г.)', default=0)
    calorific = models.IntegerField('Калорийность (на 100г.)', default=0)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'Блюдо'
        verbose_name_plural = 'Блюда'
