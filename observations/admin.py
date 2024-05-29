from django.contrib import admin
from observations.models import Observation


# Register your models here.
class ObservationAdmin(admin.ModelAdmin):
    fieldsets = [
        ('观察地点', {'fields': ['location']}),
        ('观察现象', {'fields': ['description']}),
        ('备注信息', {'fields': ['additional_notes']}),
        ('观察数据', {'fields': ['observation_data']}),
        ('预测结果', {'fields': ['tags']}),
    ]
    search_fields = ['name']
    list_display = ['date', 'location', 'description', 'additional_notes', 'observation_data', 'tags']


admin.site.register(Observation, ObservationAdmin)
