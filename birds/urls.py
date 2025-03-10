from django.urls import path, include
from .views import *

urlpatterns = [
    path('birds_archive/', Birds_Archive, name='Birds_Archive'),
    path('search/', search, name='search')
]
