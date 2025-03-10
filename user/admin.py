from django.contrib import admin
from user.models import UserInfo

# Register your models here.
admin.site.site_header = '管理后台'
admin.site.site_title = '管理后台'
admin.site.index_title = '管理后台'


class UserInfoAdmin(admin.ModelAdmin):
    search_fields = ['user_id']
    list_display = ['user_id', 'username', 'pwd', 'sex', 'age', 'birthday', 'phone', 'email', 'resume', 'pub_date']


admin.site.register(UserInfo, UserInfoAdmin)
