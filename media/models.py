from django.db import models

from user.models import UserInfo


# Create your models here.
class MediaSocial(models.Model):
    media_text = models.TextField(blank=True, null=True, verbose_name='帖子内容')
    release_time = models.DateTimeField(auto_now=True, verbose_name='发布时间')
    media_support = models.IntegerField(default=0, verbose_name='点赞数')
    media_dislike = models.IntegerField(default=0, verbose_name='不喜欢数')
    user = models.ForeignKey(UserInfo, on_delete=models.CASCADE, related_name='posts', verbose_name='用户', blank=True,
                             null=True)

    class Meta:
        verbose_name = '媒体数据'
        verbose_name_plural = verbose_name
