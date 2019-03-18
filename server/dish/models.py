from django.db import models

# Create your models here.

class Dish(models.Model):
    name = models.CharField('Название блюда', max_length=512)

    class Meta:
        verbose_name = 'Блюдо'
        verbose_name_plural = 'Блюда'