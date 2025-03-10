import hashlib
import os
import uuid

from django.conf import settings
from django.db.models import Q
from django.http import JsonResponse
from django.shortcuts import render, redirect
from user.forms.account import RegisterModelForm, LoginForm
from user.models import UserInfo


def login(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        pwd = request.POST.get('pwd')
        res = pwd + settings.SECRET_KEY
        pwd = hashlib.md5(res.encode('utf-8')).hexdigest()
        UserInfo_obj = UserInfo.objects.filter(username=username).first()
        if UserInfo_obj and UserInfo_obj.pwd == pwd and UserInfo_obj.username == username:
            request.session['user_id'] = UserInfo_obj.user_id
            return render(request, 'index.html')
        else:
            return render(request, "user/login.html", {"error_msg": "用户名或密码错误"})
    return render(request, "user/login.html")


def regist(request):
    if request.method == "POST":
        username = request.POST.get('username')
        pwd = request.POST.get('pwd')
        # 密码加密
        res = pwd + settings.SECRET_KEY
        pwd = hashlib.md5(res.encode('utf-8')).hexdigest()
        # 密码加密
        existing_account = UserInfo.objects.filter(username=username)
        if existing_account.exists():
            return render(request, 'user/regist.html', {"error_msg": "用户名重复"})
        else:
            UserInfo.objects.create(username=username, pwd=pwd)
            return render(request, 'user/regist.html', {"success_msg": "注册成功"})
    return render(request, "user/regist.html")

# def login(request):
#     if request.method == 'GET':
#         form = LoginForm(request)
#         return render(request, 'user/login_form.html', {'form': form})
#     form = LoginForm(request, data=request.POST)
#     if form.is_valid():
#         # 验证用户提交的数据是否符合表单的定义和规则
#         username = form.cleaned_data['username']
#         password = form.cleaned_data['password']
#         user_object = UserInfo.objects.filter(Q(username=username)).filter(pwd=password).first()
#         if user_object:
#             request.session['user_id'] = user_object.id
#             request.session.set_expiry(60 * 60 * 24 * 14)
#             return redirect('index')
#         form.add_error('username', '用户名或密码错误')
#     return render(request, 'user/login_form.html', {'form': form})
#
#
# def regist(request):
#     if request.method == 'GET':
#         form = RegisterModelForm
#         return render(request, 'user/regist_form.html', {'form': form})
#     # 将注册表单对象传递给注册页面的模板，渲染并返回给用户。
#     form = RegisterModelForm(data=request.POST)
#     # 用户通过 POST 请求提交的数据 request.POST 传递给该表单实例
#     if form.is_valid():
#         form.save()
#         return JsonResponse({'status': True, 'data': '/login/'})
#     # 返回一个 JSON 格式的响应，表示注册成功，重定向到登录页面
#     return JsonResponse({'status': False, 'error': form.errors})


def index(request):
    return render(request, "index.html")


def loginout(request):
    return render(request, 'user/login.html')


def show_user_message(request):
    user_id = request.session.get('user_id')
    username = UserInfo.objects.get(user_id=user_id).username
    message = UserInfo.objects.filter(user_id=user_id)
    context = {'message': message, 'username': username}
    return render(request, 'user/show_user_message.html', context)


def change_user_message(request):
    user_id = request.session.get('user_id')
    username = UserInfo.objects.get(user_id=user_id).username
    context = {'user_id': user_id, 'username': username}
    return render(request, 'user/change_user_message.html', context)


def change(request, user_id):
    if request.POST:
        username = request.POST.get('username')
        sex = request.POST.get('sex')
        age = request.POST.get('age')
        phone = request.POST.get('phone')
        email = request.POST.get('email')
        resume = request.POST.get('resume')
        birthday = request.POST.get('birthday')
        UserInfo_obj = UserInfo.objects.get(user_id=user_id)
        UserInfo_obj.username = username
        UserInfo_obj.sex = sex
        UserInfo_obj.age = age
        UserInfo_obj.phone = phone
        UserInfo_obj.email = email
        UserInfo_obj.resume = resume
        UserInfo_obj.birthday = birthday
        UserInfo_obj.save()
        return redirect('/show_user_message/')
    return render(request, 'user/show_user_message.html')


def show_change_image(request):
    user_id = request.session.get('user_id')
    context = {'user_id': user_id}
    return render(request, 'user/change_image.html', context)


def change_image(request, user_id):
    if request.POST:
        imageFile = request.FILES.get('File')
        picFileStuff = os.path.splitext(imageFile.name)[1]
        allowedTypes = ['.jpg', '.png']
        # 上传图片
        if picFileStuff.lower() == allowedTypes[0]:
            # 生成唯一的文件名称
            picUploadUniqueName = str(uuid.uuid1()) + picFileStuff
            uploadDirpath = os.path.join(os.getcwd(), 'static/img/avatar/')
            if not os.path.exists(uploadDirpath):
                os.makedirs(uploadDirpath)
            picFileFullPath = uploadDirpath + os.sep + picUploadUniqueName  # 图片上传的全路径
            try:
                with open(picFileFullPath, 'wb+') as fp:
                    for chunk in imageFile.chunks():
                        fp.write(chunk)
                    fp.close()
            except:
                return render(request, 'user/show_user_message.html', {'error': '图片上传失败'})
            image_url = 'img/avatar/' + picUploadUniqueName
            UserInfo_obj = UserInfo.objects.get(user_id=user_id)
            UserInfo_obj.image = image_url
            UserInfo_obj.save()
            return redirect('/show_user_message/')
    return render(request, 'user/show_user_message.html')
