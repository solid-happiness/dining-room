from django.contrib import admin
from eatery.models import DiningRoom, HoliDay, DishCategory, Shedule, MenuItem, DindingRoomMenu, WeekDay


class SheduleAdmin(admin.ModelAdmin):
    DAY_NAMES = ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun']
    day_fields = []
    for day in DAY_NAMES:
        day_fields.append((f'{day}_open', f'{day}_close'))
    day_fields.append('holidays')
    fields = day_fields


# Register your models here.
admin.site.register(DiningRoom)
admin.site.register(HoliDay)
admin.site.register(DishCategory)
admin.site.register(Shedule, SheduleAdmin)
admin.site.register(MenuItem)
admin.site.register(DindingRoomMenu)
admin.site.register(WeekDay)