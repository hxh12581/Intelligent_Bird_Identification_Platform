from django.contrib import admin
from birds.models import Bird


# Register your models here.
class BirdAdmin(admin.ModelAdmin):
    fieldsets = [
        ('图片', {'fields': ['images']}),
        ('通用名称', {'fields': ['name']}),
        ('目', {'fields': ['order']}),
        ('科', {'fields': ['family']}),
        ('属', {'fields': ['genus']}),
        ('体型特征', {'fields': ['size']}),
        ('羽毛特征', {'fields': ['plumage']}),
        ('栖息地', {'fields': ['habitat']}),
        ('地理分布', {'fields': ['distribution']}),
        ('保护等级', {'fields': ['iucn_status']}),
        ('人气值', {'fields': ['love_number']}),
        ('观察数', {'fields': ['observations_number']}),
    ]
    search_fields = ['name']
    list_display = ['images', 'name', 'order', 'family', 'genus', 'size', 'plumage', 'habitat',
                    'distribution', 'iucn_status', 'love_number', 'observations_number']


admin.site.register(Bird, BirdAdmin)
