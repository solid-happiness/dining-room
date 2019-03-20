# Generated by Django 2.1.7 on 2019-03-20 15:18

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Dish',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=512, verbose_name='Название блюда')),
                ('proteins', models.FloatField(default=0, verbose_name='Белки (на 100г.)')),
                ('fats', models.FloatField(default=0, verbose_name='Жиры (на 100г.)')),
                ('carbohydrates', models.FloatField(default=0, verbose_name='Углеводы (на 100г.)')),
                ('calorific', models.IntegerField(default=0, help_text='В калориях (не ККал!).', verbose_name='Калорийность (на 100г.)')),
            ],
            options={
                'verbose_name': 'Блюдо',
                'verbose_name_plural': 'Блюда',
            },
        ),
    ]
