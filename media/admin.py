from django.contrib import admin
from media.models import MediaSocial


# Register your models here.
class MediaSocialAdmin(admin.ModelAdmin):
    fieldsets = [
        ('帖子内容', {'fields': ['media_text']}),
        ('点赞数', {'fields': ['media_support']}),
        ('不喜欢数', {'fields': ['media_dislike']}),
    ]
    search_fields = ['media_text', 'release_time']
    list_display = ['media_text', 'release_time']


admin.site.register(MediaSocial, MediaSocialAdmin)
