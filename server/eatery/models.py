from django.db import models
from datetime import time, datetime
import itertools


# Create your models here.


class MenuItem(models.Model):
    """
    Модель пункта меню.
    Содержит блюдо и его товарные характеристики.
    """
    dish = models.ForeignKey('dish.Dish', verbose_name='Блюдо', on_delete=models.CASCADE)
    price = models.IntegerField(
        'Цена',
        help_text='Цена выражается в копейках.',
        default=0
    )
    portion = models.CharField(
        'Граммовка',
        help_text='Строковое представление для отображения на странице. Например: 250/25.',
        max_length=64,
        default='0',
    )
    net_weight = models.FloatField(
        'Масса нетто',
        help_text='Полная масса готового блюда. Если оно составное, то суммарный вес всех входящих продуктов.',
        default=0
    )
    category = models.ForeignKey(
        'DishCategory',
        verbose_name='Категория',
        on_delete=models.CASCADE,
    )
    photo = models.ImageField(
        'Фото блюда',
        upload_to='dishes',
        null=True,
        blank=True,
    )

    def __str__(self):
        return str(self.dish)

    class Meta:
        verbose_name = 'Пункт меню'
        verbose_name_plural = 'Пункты меню'

    def to_dict(self):
        """
        Метод для удобства возврата экземпляра модели и последуюещй конвертации в json.
        """
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
    """
    Модель категории блюд в меню заведения
    """
    name = models.CharField(
        'Название категории',
        max_length=128
    )
    slug = models.CharField(
        'slug',
        help_text='Уникальное представление названия, только латинские буквы и занк " - " (тире).',
        max_length=64,
        unique=True
    )

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'Категория блюд'
        verbose_name_plural = 'Категории блюд'

    def to_dict(self):
        """
        Метод для удобства возврата экземпляра модели и последуюещй конвертации в json.
        """
        return {
            'id': self.id,
            'slug': self.slug,
            'name': self.name
        }


class HoliDay(models.Model):
    """
    Модель для добавления выходных дней в расписании.
    """
    day = models.DateField(
        verbose_name='дата выходного дня'
    )

    def __str__(self):
        return str(self.day)

    class Meta:
        verbose_name = 'Выходной день'
        verbose_name_plural = 'Выходные дни'


class Shedule(models.Model):
    """
    Модель расписания работы заведения.
    Также содержит поля времени открытия и закрытия заведения для каждого дня недели
        в формате (день)_open и (день)_close.
    """
    holidays = models.ManyToManyField(
        HoliDay,
        verbose_name='Выходные дни',
        blank=True
    )

    def __str__(self):
        return f'Расписание {self.pk} {self.get_open_time()}'

    def get_open_time(self):
        """
        Метод, возвращающий время открытия и закрытия для текущего дня.
        Предварительно проверяет, выходной сегодня день или нет.
        """
        for holiday in self.holidays.all():
            if datetime.today().date() == holiday.day:
                return 0
        weekday = datetime.today().weekday()
        open = getattr(self, f'{DAY_NAMES[weekday][0]}_open')
        close = getattr(self, f'{DAY_NAMES[weekday][0]}_close')
        return open, close

    class Meta:
        verbose_name = 'Расписание работы'
        verbose_name_plural = 'Расписания работы'


# Дни недели с краткими ключами и полнымим наименованиями.
DAY_NAMES = (
    ('mon', 'Понедельник'),
    ('tue', 'Вторник'),
    ('wed', 'Среда'),
    ('thu', 'Четверг'),
    ('fri', 'Пятница'),
    ('sat', 'Суббота'),
    ('sun', 'Воскресенье')
)

# добавим поля времени открытия и закрытия по дням недели в модель Shedule
for day, day_name in DAY_NAMES:
    Shedule.add_to_class(f'{day}_open', models.TimeField(verbose_name=f'{day_name} - открытие', default=time(0, 0)))
    Shedule.add_to_class(f'{day}_close', models.TimeField(verbose_name=f'{day_name} - закрытие', default=time(0, 0)))


class DiningRoom(models.Model):
    """
    Модель описания заведения.
    """
    name = models.CharField(
        'Название заведения',
        max_length=128
    )
    slug = models.CharField(
        'slug',
        help_text='Уникальное представление названия, только латинские буквы и занк " - " (тире).',
        max_length=64,
        unique=True
    )
    schedule = models.ForeignKey(
        'Shedule',
        verbose_name='Расписание',
        on_delete=models.CASCADE
    )
    description = models.CharField(
        'Описание столовой',
        max_length=512,
        default=''
    )
    photo = models.ImageField(
        'Фото заведения',
        upload_to='dining-room',
        null=True,
        blank=True,
    )

    def __str__(self):
        return self.name

    def to_dict(self):
        open_time, close_time = self.schedule.get_open_time()
        return {
            'name': self.name,
            'description': self.description,
            'openTime': open_time,
            'closeTime': close_time,
        }

    class Meta:
        verbose_name = 'Столовая'
        verbose_name_plural = 'Столовые'


class WeekDay(models.Model):
    """
    Модель дня недели.
    Добавлена для возможности удобного множественного выбора прикрепления меню к дням недели.
    """
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
    Mодель меню для заведения.
    Привязана к заведению и дням недели.
    """
    dining_room = models.ForeignKey(
        DiningRoom,
        verbose_name='Заведение',
        help_text='Для какого заведения действует данное меню.',
        on_delete=models.CASCADE,
        null=True,
    )
    weekday = models.ManyToManyField(
        WeekDay,
        verbose_name='Дни',
        help_text='Дни недели, когда действует данное меню.'
    )
    dishes = models.ManyToManyField(
        MenuItem,
        verbose_name='Блюда',
        help_text='Блюда в меню.'
    )

    def __str__(self):
        weekday_list = map(str, list(self.weekday.all()))
        return f'{self.dining_room} ({", ".join(weekday_list)})'

    class Meta:
        verbose_name = 'Меню'
        verbose_name_plural = 'Меню'

    def get_menu(self):
        """
        Метод, возвращающий меню.
        Блюда раскладываются по категориям.
        """
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
        return menu
