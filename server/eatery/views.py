from django.http import JsonResponse
from .models import DiningRoom


# Create your views here.


def get_eateries(request):
    eateries = DiningRoom.objects.all()
    return JsonResponse({'eateries': eatery.to_dict for eatery in eateries})


def get_eatery(request, eatery_name):
    return JsonResponse({'eatery_name': eatery_name})
