from django.urls import path
from . import views

urlpatterns = [
    path('/', views.get_eateries),
    path('/<slug:eatery_name>/', views.get_eatery),
]
