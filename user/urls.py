from django.urls import path
from .views import *

urlpatterns = [
    path('login/', login, name='login'),
    path('regist/', regist, name='regist'),
    path('index/', index, name='index'),
    path('', loginout, name='loginout'),
    path('show_user_message/', show_user_message, name='show_user_message'),
    path('change_user_message/', change_user_message, name='change_user_message'),
    path('change/<int:user_id>/', change, name='change'),
    path('change_image/<int:user_id>/', change_image, name='change_image'),
    path('show_change_image/', show_change_image, name='show_change_image'),
]
