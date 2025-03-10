from django.urls import path, include
from .views import *

urlpatterns = [
    path('social_media/', social_media, name='social_media'),
    path('send_message/', send_message, name='send_message'),
    path('support_message/<int:id>/', support_message, name='support_message'),
    path('dislike_message/<int:id>/', dislike_message, name='dislike_message'),
    path('select_user_message/<str:username>/', select_user_message, name='select_user_message'),
]
