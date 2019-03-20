from django.contrib import admin
from eatery.models import DiningRoom, HoliDay, DishCategory, Shedule, MenuItem, DiningRoomMenu
from django.db.models import Q


class SheduleAdmin(admin.ModelAdmin):
    # Группируем время открытия и закрытия по дням недели
    DAY_NAMES = ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun']
    day_fields = []
    for day in DAY_NAMES:
        day_fields.append((f'{day}_open', f'{day}_close'))
    day_fields.append('holidays')
    fields = day_fields

    search_fields = ('diningroom__name', )
    list_filter = ('diningroom__name',)


class MenuItemAdmin(admin.ModelAdmin):
    search_fields = ('dish__name', 'category__name')
    list_filter = ('category__name',)
    autocomplete_fields = ('dish', )


class DiningRoomMenuAdmin(admin.ModelAdmin):
    list_filter = ('dining_room', 'weekday')
    autocomplete_fields = ('dishes',)


class DiningRoomAdmin(admin.ModelAdmin):
    """
    Отфильтруем модели расписания на странице заведения,
        оставив непривязанные модели расписаний и привязанную к данному заведению.
    """
    def get_form(self, request, obj=None, **kwargs):
        form = super(DiningRoomAdmin, self).get_form(request, obj, **kwargs)

        # Фильтр: нет привязки к DiningRoom или привязка к текущему объекту
        qs = Q(diningroom__isnull=True) | Q(diningroom=obj)

        # Фильтруем поле schedule
        form.base_fields['schedule'].queryset = \
            Shedule.objects.filter(qs)
        return form

# Register your models here.

admin.site.register(DiningRoom, DiningRoomAdmin)
admin.site.register(HoliDay)
admin.site.register(DishCategory)
admin.site.register(Shedule, SheduleAdmin)
admin.site.register(MenuItem, MenuItemAdmin)
admin.site.register(DiningRoomMenu, DiningRoomMenuAdmin)
