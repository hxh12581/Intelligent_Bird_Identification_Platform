from django.db import models


# Create your models here.

class Bird(models.Model):
    id = models.AutoField(primary_key=True)
    images = models.CharField(verbose_name='鸟类图片', max_length=255)
    name = models.CharField(verbose_name='鸟类名称', max_length=50)
    order = models.CharField(verbose_name='目', max_length=50)  # 鸟类所属的目
    family = models.CharField(verbose_name='科', max_length=50)  # 鸟类所属的科
    genus = models.CharField(verbose_name='科', max_length=50)  # 鸟类所属的属
    size = models.CharField(verbose_name='体型描述', max_length=100)  # 鸟类的体型描述，如长度、翼展、重量等
    plumage = models.CharField(verbose_name='羽毛描述', max_length=255)  # 羽毛的颜色和图案
    habitat = models.CharField(verbose_name='栖息地分布', max_length=100)  # 鸟类的栖息地，如森林、湿地、草原等
    distribution = models.CharField(verbose_name='地理分布', max_length=255)  # 鸟类的地理分布范围
    iucn_status = models.CharField(verbose_name='保护等级', max_length=50)  # 根据IUCN（国际自然保护联盟）的评估，鸟类的保护等级。
    love_number = models.IntegerField()  # 人气值
    observations_number = models.IntegerField()  # 观察数
    date = models.DateField(auto_now_add=True, verbose_name='添加时间')

    class Meta:
        verbose_name = '鸟类数据'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name
