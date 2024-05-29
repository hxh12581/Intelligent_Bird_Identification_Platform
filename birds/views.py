from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.db.models import  Q

from birds.models import Bird
from django.shortcuts import render, redirect
from observations.models import Observation


# Create your views here.
def Birds_Archive(request):
    Birds_Archive_message = Bird.objects.all()
    # 统计每个bird_id对应的观察数
    # observations_count = Observation.objects.values('bird_id').annotate(total_observations=Count('bird_id'))
    # # 数据结构:字典->QuerySet查询集->查询集表示数据库中满足查询条件的一组对象
    # for observation in observations_count:
    #     if observation['bird_id']:
    #         bird_id = observation['bird_id']
    #         total_observations = observation['total_observations']
    #         # {鸟类ID,观察数}
    #         bird = Bird.objects.get(id=bird_id)
    #         bird.observations_number = total_observations
    #         bird.save()
    #     break
    pageinator = Paginator(Birds_Archive_message, 3)
    page = request.GET.get('page', 1)
    try:
        Birds_Archive_message = pageinator.page(page)
    except EmptyPage:
        Birds_Archive_message = pageinator.page(1)
    except PageNotAnInteger:
        Birds_Archive_message = pageinator.page(pageinator.num_pages)
    context = {'Birds_Archive_message': Birds_Archive_message}
    return render(request, 'birds/Birds_Archive.html', context)


def search(reqeust):
    text = reqeust.GET.get('text')
    res = Bird.objects.filter(Q(name__icontains=text) | Q(order__icontains=text) | Q(family__icontains=text)
                              | Q(size__icontains=text) | Q(plumage__icontains=text) | Q(habitat__icontains=text)
                              | Q(distribution__icontains=text) | Q(iucn_status__contains=text))
    context = {'res': res}
    return render(reqeust, 'birds/search_result.html', context)
