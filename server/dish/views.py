from django.shortcuts import render
from django.http import JsonResponse

# Create your views here.


def get_dishes(request):
    return JsonResponse({'a': 1, 'b': 2})