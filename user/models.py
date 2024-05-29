from django.db import models
from observations.models import Observation


# Create your models here.
class UserInfo(models.Model):
    user_id = models.AutoField(primary_key=True)
    username = models.CharField(verbose_name='用户名', max_length=32)
    pwd = models.CharField(verbose_name='密码', max_length=32)
    sex = models.CharField(verbose_name='性别', max_length=10, choices=(('男', '男'), ('女', '女')), null=True)
    age = models.IntegerField(verbose_name='年龄', blank=True, null=True)
    birthday = models.DateField(verbose_name='生日', blank=True, null=True)
    phone = models.CharField(verbose_name='电话号码', max_length=32, blank=True, null=True)
    email = models.EmailField(verbose_name='邮箱', max_length=32, blank=True, null=True)
    resume = models.TextField(verbose_name='简介', max_length=255, blank=True, null=True)
    image = models.ImageField(verbose_name='用户头像', upload_to='img/avatar/%Y/%m/%d/', default='img/avatar/default.png',
                              max_length=255)
    pub_date = models.DateTimeField(auto_now=True, verbose_name='修改时间')
    observation = models.ManyToManyField(Observation, related_name='observation')
    love = models.ManyToManyField(Observation, related_name='love')

    class Meta:
        verbose_name = '用户数据'
        verbose_name_plural = verbose_name
