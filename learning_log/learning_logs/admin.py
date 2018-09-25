from django.contrib import admin
from .models import *


# Register your models here.

class TopicAdmin(admin.ModelAdmin):
    list_display = ['text', 'date_added']  # 显示实体信息页上的字段们
    list_display_links = ['text']  # 能够连接到详细页面
    search_fields = ['text', 'date_added']  # 允许被搜索的字段
    list_filter = ['text', 'date_added']  # 右侧过滤器，可被过滤的字段
    date_hierarchy = 'date_added'  # 增加时间选择器
    # 在实体的详细页面中，对属性进行分组
    fieldsets = (
        ('基本设置', {
            'fields': ('text',),
        }),
    )


class EntryAdmin(admin.ModelAdmin):
    list_display = ['topic', 'text', 'date_added']
    search_fields = ['topic', 'text', 'date_added']
    list_filter = ['topic', 'date_added']
    date_hierarchy = 'date_added'
    fieldsets = (
        ('基本设置', {
            'fields': ('topic', 'text'),
        }),
    )


class HistoryAdmin(admin.ModelAdmin):
    list_display = ['text', 'num', 'date_added', ]
    search_fields = ['text', 'num', ]
    list_filter = ['text', 'date_added']
    date_hierarchy = 'date_added'
    fieldsets = (
        ('基本设置', {
            'fields': ('text', 'num'),
        }),
    )


# 注册Model类，高级管理类
admin.site.register(Topic, TopicAdmin)
admin.site.register(Entry, EntryAdmin)
admin.site.register(History, HistoryAdmin)
