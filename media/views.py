from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.shortcuts import render, redirect

from media.models import MediaSocial
from user.models import UserInfo
from django.shortcuts import redirect, render
from django.db.models import F


# Create your views here.

def social_media(request):
    user_id = request.session.get('user_id')
    current_user_message = UserInfo.objects.filter(user_id=user_id).first()
    media_message = MediaSocial.objects.all().order_by('-release_time')
    pageinator = Paginator(media_message, 4)
    page = request.GET.get('page', 1)
    try:
        page_message = pageinator.page(page)
    except EmptyPage:
        page_message = pageinator.page(1)
    except PageNotAnInteger:
        page_message = pageinator.page(pageinator.num_pages)

    context = {
        'current_user_message': current_user_message,
        'page_message': page_message,
    }
    return render(request, 'media/social_media.html', context)


def send_message(request):
    user_id = request.session.get('user_id')
    if request.method == 'POST':
        send_text = request.POST.get('message')
        MediaSocial.objects.create(media_text=send_text, user_id=user_id)
        return redirect('/media/social_media/')
    return render(request, 'media/social_media.html')


def support_message(request, id):
    if request.method == 'POST':
        MediaSocial.objects.filter(id=id).update(media_support=F('media_support') + 1)
        return redirect('/media/social_media/')
    return render(request, 'media/social_media.html')


def dislike_message(request, id):
    if request.method == 'POST':
        MediaSocial.objects.filter(id=id).update(media_dislike=F('media_dislike') + 1)
        return redirect('/media/social_media/')
    return render(request, 'media/social_media.html')


def select_user_message(request, username):
    message = UserInfo.objects.filter(username=username).first()
    context = {'message': message}
    return render(request, 'media/select_result_mesage.html', context)
