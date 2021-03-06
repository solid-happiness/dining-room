# Generated by Django 2.1.7 on 2019-03-20 15:18

import datetime
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('dish', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='DiningRoom',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=128, verbose_name='Название заведения')),
                ('slug', models.CharField(help_text='Уникальное представление названия, только латинские буквы и занк " - " (тире).', max_length=64, unique=True, verbose_name='slug')),
                ('description', models.CharField(default='', max_length=512, verbose_name='Описание столовой')),
                ('photo', models.ImageField(blank=True, null=True, upload_to='dining-room', verbose_name='Фото заведения')),
            ],
            options={
                'verbose_name': 'Столовая',
                'verbose_name_plural': 'Столовые',
            },
        ),
        migrations.CreateModel(
            name='DiningRoomMenu',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('dining_room', models.ForeignKey(help_text='Для какого заведения действует данное меню.', null=True, on_delete=django.db.models.deletion.CASCADE, to='eatery.DiningRoom', verbose_name='Заведение')),
            ],
            options={
                'verbose_name': 'Меню',
                'verbose_name_plural': 'Меню',
            },
        ),
        migrations.CreateModel(
            name='DishCategory',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=128, verbose_name='Название категории')),
                ('slug', models.CharField(help_text='Уникальное представление названия, только латинские буквы и занк " - " (тире).', max_length=64, unique=True, verbose_name='slug')),
            ],
            options={
                'verbose_name': 'Категория блюд',
                'verbose_name_plural': 'Категории блюд',
            },
        ),
        migrations.CreateModel(
            name='HoliDay',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('day', models.DateField(verbose_name='дата выходного дня')),
            ],
            options={
                'verbose_name': 'Выходной день',
                'verbose_name_plural': 'Выходные дни',
            },
        ),
        migrations.CreateModel(
            name='MenuItem',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('price', models.IntegerField(default=0, help_text='Цена выражается в копейках.', verbose_name='Цена')),
                ('portion', models.CharField(default='0', help_text='Строковое представление для отображения на странице. Например: 250/25.', max_length=64, verbose_name='Граммовка')),
                ('net_weight', models.FloatField(default=0, help_text='Полная масса готового блюда. Если оно составное, то суммарный вес всех входящих продуктов.', verbose_name='Масса нетто')),
                ('photo', models.ImageField(blank=True, null=True, upload_to='dishes', verbose_name='Фото блюда')),
                ('category', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='eatery.DishCategory', verbose_name='Категория')),
                ('dish', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='dish.Dish', verbose_name='Блюдо')),
            ],
            options={
                'verbose_name': 'Пункт меню',
                'verbose_name_plural': 'Пункты меню',
            },
        ),
        migrations.CreateModel(
            name='Shedule',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('mon_open', models.TimeField(default=datetime.time(0, 0), verbose_name='Понедельник - открытие')),
                ('mon_close', models.TimeField(default=datetime.time(0, 0), verbose_name='Понедельник - закрытие')),
                ('tue_open', models.TimeField(default=datetime.time(0, 0), verbose_name='Вторник - открытие')),
                ('tue_close', models.TimeField(default=datetime.time(0, 0), verbose_name='Вторник - закрытие')),
                ('wed_open', models.TimeField(default=datetime.time(0, 0), verbose_name='Среда - открытие')),
                ('wed_close', models.TimeField(default=datetime.time(0, 0), verbose_name='Среда - закрытие')),
                ('thu_open', models.TimeField(default=datetime.time(0, 0), verbose_name='Четверг - открытие')),
                ('thu_close', models.TimeField(default=datetime.time(0, 0), verbose_name='Четверг - закрытие')),
                ('fri_open', models.TimeField(default=datetime.time(0, 0), verbose_name='Пятница - открытие')),
                ('fri_close', models.TimeField(default=datetime.time(0, 0), verbose_name='Пятница - закрытие')),
                ('sat_open', models.TimeField(default=datetime.time(0, 0), verbose_name='Суббота - открытие')),
                ('sat_close', models.TimeField(default=datetime.time(0, 0), verbose_name='Суббота - закрытие')),
                ('sun_open', models.TimeField(default=datetime.time(0, 0), verbose_name='Воскресенье - открытие')),
                ('sun_close', models.TimeField(default=datetime.time(0, 0), verbose_name='Воскресенье - закрытие')),
                ('holidays', models.ManyToManyField(blank=True, to='eatery.HoliDay', verbose_name='Выходные дни')),
            ],
            options={
                'verbose_name': 'Расписание работы',
                'verbose_name_plural': 'Расписания работы',
            },
        ),
        migrations.CreateModel(
            name='WeekDay',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('day', models.CharField(choices=[('mon', 'Понедельник'), ('tue', 'Вторник'), ('wed', 'Среда'), ('thu', 'Четверг'), ('fri', 'Пятница'), ('sat', 'Суббота'), ('sun', 'Воскресенье')], default='', max_length=3, verbose_name='День недели')),
            ],
            options={
                'verbose_name': 'День недели',
                'verbose_name_plural': 'Дни недели',
            },
        ),
        migrations.AddField(
            model_name='diningroommenu',
            name='dishes',
            field=models.ManyToManyField(help_text='Блюда в меню.', to='eatery.MenuItem', verbose_name='Блюда'),
        ),
        migrations.AddField(
            model_name='diningroommenu',
            name='weekday',
            field=models.ManyToManyField(help_text='Дни недели, когда действует данное меню.', to='eatery.WeekDay', verbose_name='Дни'),
        ),
        migrations.AddField(
            model_name='diningroom',
            name='schedule',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='eatery.Shedule', verbose_name='Расписание'),
        ),
    ]
