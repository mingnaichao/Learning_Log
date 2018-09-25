from django.contrib import admin
from .models import User


# Register your models here.
class UserAdmin(admin.ModelAdmin):
    list_display = ['id', 'username', 'email', 'date_joined', 'last_login', 'is_active', 'is_staff',
                    'is_superuser', ]  # 显示实体信息页上的字段们
    list_editable = ['email']  # 可编辑的字段
    search_fields = ['id', 'username', 'email']  # 允许被搜索的字段
    list_filter = ['username', 'email']  # 右侧过滤器，可被过滤的字段
    # 在实体的详细页面中，对属性进行分组
    fieldsets = (
        ('基本设置', {
            'fields': ('username', 'nickname', 'email',),
        }),
        ('高级设置', {
            'fields': ('is_active', 'is_staff', 'is_superuser', 'groups', 'date_joined', 'last_login',),
        }),
        ('隐私信息', {
            'fields': ('password',),
            'classes': ('collapse',)  # 可隐藏
        }),
    )


# 注册Model类，高级管理类
admin.site.register(User, UserAdmin)
