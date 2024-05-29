from django.db import models

from birds.models import Bird


# Create your models here.
class Observation(models.Model):
    id = models.AutoField(primary_key=True)
    date = models.DateTimeField(auto_now=True, verbose_name='观察时间')
    location = models.CharField(verbose_name='观察地点', max_length=255)
    description = models.TextField(verbose_name='观察现象')
    # 观察者可能添加的其他相关信息或备注
    additional_notes = models.TextField(verbose_name='备注信息', blank=True, null=True)
    # 存储观察时拍摄的图片的路径或链接
    observation_data = models.CharField(verbose_name='观察数据', max_length=255)
    tags = models.CharField(verbose_name='预测结果', max_length=255, blank=True)
    bird = models.ForeignKey(Bird, on_delete=models.CASCADE, blank=True, null=True)

    class Meta:
        verbose_name = '观察数据'
        verbose_name_plural = verbose_name
