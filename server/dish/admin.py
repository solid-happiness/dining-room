from django.contrib import admin
from dish.models import Dish

# Register your models here.


class DishAdmin(admin.ModelAdmin):
    search_fields = ('name', )


admin.site.register(Dish, DishAdmin)