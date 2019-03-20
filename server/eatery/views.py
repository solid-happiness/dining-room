from django.http import JsonResponse
from .models import DiningRoom, DiningRoomMenu, WeekDay
from datetime import datetime


def get_eateries(request):
    eateries = DiningRoom.objects.all()
    return JsonResponse({'eateries': [eatery.to_dict() for eatery in eateries]})


def get_eatery(request, eatery_name):
    weekday_today = WeekDay.objects.get(pk=datetime.today().isoweekday())
    try:
        eatery = DiningRoom.objects.get(slug=eatery_name)
    except DiningRoom.DoesNotExist:
        return JsonResponse({})
    try:
        dining_room_menu = DiningRoomMenu.objects.get(dining_room=eatery, weekday=weekday_today).get_menu()
    except DiningRoom.DoesNotExist:
        return JsonResponse({})
    return JsonResponse({**eatery.to_dict(), 'menu': dining_room_menu})
