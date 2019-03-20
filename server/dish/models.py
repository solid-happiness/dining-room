from django.db import models


# Create your models here.


class Dish(models.Model):
    """
    Модель блюда.
    Модель вынесена в отдельное приложение для возможности дальнейщей кастомизации создания блюда.
        Например составлять блюдо из продуктов и тд.
    """
    name = models.CharField(
        'Название блюда',
        max_length=512,
    )
    proteins = models.FloatField(
        'Белки (на 100г.)',
        default=0,
    )
    fats = models.FloatField(
        'Жиры (на 100г.)',
        default=0,
    )
    carbohydrates = models.FloatField(
        'Углеводы (на 100г.)',
        default=0,
    )
    calorific = models.IntegerField(
        'Калорийность (на 100г.)',
        help_text='В калориях (не ККал!).',
        default=0,
    )

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'Блюдо'
        verbose_name_plural = 'Блюда'
