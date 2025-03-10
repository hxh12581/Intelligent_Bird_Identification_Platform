import os
import threading
import uuid

import cv2
import numpy as np
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.http import HttpResponse
from django.shortcuts import render, redirect, get_object_or_404
from observations.models import Observation
from user.models import UserInfo
from tensorflow.python.keras import models
from birds.models import Bird
from ultralytics import YOLO
from django.db.models import F


# Create your views here.

def observations(request):
    user_id = request.session.get('user_id')
    observations_message = UserInfo.objects.filter(user_id=user_id).first().observation.all()
    pageinator = Paginator(observations_message, 3)
    page = request.GET.get('page', 1)
    try:
        observations_message = pageinator.page(page)
    except EmptyPage:
        observations_message = pageinator.page(1)
    except PageNotAnInteger:
        observations_message = pageinator.page(pageinator.num_pages)
    context = {'observations_message': observations_message}
    return render(request, 'observations/observations.html', context)


def add(request):
    if request.POST:
        location = request.POST.get('location')
        description = request.POST.get('description')
        additional_notes = request.POST.get('additional_notes')
        imageFile = request.FILES.get('File')
        picFileStuff = os.path.splitext(imageFile.name)[1]
        allowedTypes = ['.jpg', '.mp4']
        # 上传图片
        if picFileStuff.lower() == allowedTypes[0]:
            # 生成唯一的文件名称
            picUploadUniqueName = str(uuid.uuid1()) + picFileStuff
            uploadDirpath = os.path.join(os.getcwd(), 'static/img/upload_observation/')
            if not os.path.exists(uploadDirpath):
                os.makedirs(uploadDirpath)
            picFileFullPath = uploadDirpath + os.sep + picUploadUniqueName  # 图片上传的全路径
            try:
                with open(picFileFullPath, 'wb+') as fp:
                    for chunk in imageFile.chunks():
                        fp.write(chunk)
                    fp.close()
            except:
                return render(request, 'observations/add_observations.html', {'error': '图片上传失败'})
            image_url = 'img/upload_observation/' + picUploadUniqueName
            user_id = request.session.get('user_id')
            user_info = UserInfo.objects.get(user_id=user_id)
            observation = Observation.objects.create(location=location, description=description,
                                                     additional_notes=additional_notes, observation_data=image_url)
            # 将用户数据与观察数据关系到一起
            user_info.observation.add(observation)
            return redirect('/observations/')

        # 上传视频
        # elif picFileStuff.lower() == allowedTypes[1]:
        #     picUploadUniqueName = str(uuid.uuid1()) + picFileStuff
        #     uploadDirpath = os.path.join(os.getcwd(), 'static/video/upload_observation/')
        #     if not os.path.exists(uploadDirpath):
        #         os.makedirs(uploadDirpath)
        #     picFileFullPath = uploadDirpath + os.sep + picUploadUniqueName  # 图片上传的全路径
        #     try:
        #         with open(picFileFullPath, 'wb+') as fp:
        #             for chunk in imageFile.chunks():
        #                 fp.write(chunk)
        #             fp.close()
        #     except:
        #         return render(request, 'observations/add_observations.html', {'error': '视频上传失败'})
        #     video_url = 'video/upload_observation/' + picUploadUniqueName
        #     Observation.objects.create(date=date, location=location, description=description,
        #                                additional_notes=additional_notes, observation_data=video_url)
        #     return redirect('/observations/')
        # 异常情况
        elif picFileStuff.lower() not in allowedTypes:
            return render(request, 'observations/add_observations.html', {'error_msg': '类型错误'})
    return render(request, 'observations/add_observations.html')


def classify(request, id, page):
    observations_obj = Observation.objects.get(id=id)
    image_url = os.getcwd() + '/static/' + str(observations_obj.observation_data)
    label_name = ['信天翁', '美洲红鹮', '蔚蓝松鸦', '秃鹰', '象牙嘴噪鹃', '珍妮鹦鹉', '蓝宝石鹀', '军鹦鹉', '孔雀',
                  '粉红鸫', '红胡蜂虎', '黄胸噪鹟']
    image = cv2.imread(image_url)
    image = cv2.resize(image, (224, 224))
    image = np.array(image)
    image = image.astype('float32')
    image /= 255
    image = image.reshape(-1, 224, 224, 3)
    model = models.load_model('static/model/bird.h5')
    res = model.predict(image)
    res = label_name[np.argmax(res)]
    # 将分类结果更新到观察表中
    observations_obj.tags = res
    bird_obj = Bird.objects.get(name=observations_obj.tags)
    # 将bird表的编号记录到Observation表当中
    observations_obj.bird_id = bird_obj.id
    observations_obj.save()
    Bird.objects.filter(id=bird_obj.id).update(observations_number=F('observations_number') + 1)
    # 将观察到的鸟类观察数+1
    return redirect('/observations/' + '?page=' + str(page))


def detect(request):
    # model = YOLO('../static/model/best.pt')  # load an official detection model
    # results = model.predict(source="0", show=True, tracker="../static/model/birds.yaml")
    model = YOLO("../static/model/best.pt")
    cap = cv2.VideoCapture(0)
    while cap.isOpened():
        ret, frame = cap.read()
        # ret表示是否成功读取，frame是读取到的图像
        if ret:
            res = model(frame)
            ann = res[0].plot()
            # 将检测结果绘制在图像上，生成一个包含检测框和标签的图像
            cv2.imshow("yolo", ann)
            if cv2.waitKey(1) & 0xFF == ord('q'):
                break
    cv2.destroyAllWindows()
    cap.release()
    return redirect('/observations/')


def love(request, id, tags):
    user_id = request.session.get('user_id')
    observations = Observation.objects.filter(id=id).first()
    user = UserInfo.objects.filter(user_id=user_id).first()
    user.love.add(observations)
    Bird.objects.filter(id=observations.bird_id).update(love_number=F('love_number') + 1)
    return redirect('/observations/knowledge/' + str(id) + '/' + str(tags) + '/')


def nolove(request, id, tags):
    user_id = request.session.get('user_id')
    observations = Observation.objects.filter(id=id).first()
    user = UserInfo.objects.filter(user_id=user_id).first()
    user.love.remove(observations)
    Bird.objects.filter(id=observations.bird_id).update(love_number=F('love_number') - 1)
    return redirect('/observations/knowledge/' + str(id) + '/' + str(tags) + '/')


def knowledge(request, id, tags):
    user_id = request.session.get('user_id')
    user_love_observation = UserInfo.objects.filter(user_id=user_id).first().love.all()
    user_observation = Observation.objects.filter(id=id).first()
    love = user_observation in user_love_observation
    # 方式1:关联查询优化代码
    bird_knowledge = Observation.objects.select_related('bird').filter(bird__name=tags).first().bird
    # 方式2:直接在bird表查询数据
    # bird_knowledge = Bird.objects.filter(name=tags).first()
    # bird_knowledge = Bird.objects.filter(name=tags)
    # for i in bird_knowledge:
    #     print(i.id)
    #     print(i.nam)
    context = {'bird_knowledge': bird_knowledge, 'love': love, 'id': id, 'tags': tags}
    return render(request, 'observations/knowledge.html', context)


def delete(request, id):
    user_id = request.session.get('user_id')
    user_info = UserInfo.objects.filter(user_id=user_id).first()
    # 获取要删除的观察数据实例
    observations = Observation.objects.get(id=id)
    # 通过实例删除用户关联的观察数据
    user_info.observation.remove(observations)
    # 删除观察表内的数据
    observations.delete()
    # 减少观察数
    Bird.objects.filter(id=observations.bird_id).update(observations_number=F('observations_number') - 1)
    return redirect('/observations/')


def change(request, id):
    observation_message = Observation.objects.get(id=id)
    if request.POST:
        date = request.POST.get('date', None)
        location = request.POST.get('location', None)
        description = request.POST.get('description', None)
        additional_notes = request.POST.get('additional_notes', None)
        Observation.objects.filter(id=id).update(date=date, location=location, description=description,
                                                 additional_notes=additional_notes)
        return redirect('/observations/')
    else:
        return render(request, 'observations/change_observations.html', {'observation': observation_message})
