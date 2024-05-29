from django.urls import path, include
from .views import *

urlpatterns = [
    path('', observations, name='observations'),
    path('add/', add, name='add'),
    path('classify/<int:id>/<int:page>/', classify, name='classify'),
    path('detect/', detect, name='detect'),
    path('knowledge/<int:id>/<str:tags>/', knowledge, name='knowledge'),
    path('delete/<int:id>/', delete, name='delete'),
    path('change/<int:id>/', change, name='change'),
    path('love/<int:id>/<str:tags>/', love, name='love'),
    path('nolove/<int:id>/<str:tags>/', nolove, name='nolove'),
]
