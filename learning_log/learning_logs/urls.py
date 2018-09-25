from django.urls import re_path
from .views import *

urlpatterns = [
    # 进入主页
    re_path(r'^$', index_views, name='index'),
    # home页
    re_path(r'^home/$', home_views, name='home'),

    # 显示所有的标题
    re_path(r'^topics/$', topics_views, name='topics'),
    # 显示单个标题
    re_path(r'^topics/(?P<topic_id>\d+)/$', topic_views, name='topic'),
    # 用于添加新主题的网页
    re_path(r'^new_topic/$', new_topic_views, name='new_topic'),
    # 修改已有标题
    re_path(r'^edit_topic/(?P<topic_id>\d+)/$', edit_topic_views, name='edit_topic'),
    # 删除标题
    re_path(r'^delete_topic/(?P<topic_id>\d+)/$', delete_topic_views, name='delete_topic'),

    # 添加笔记
    re_path(r'^new_entry/(?P<topic_id>\d+)/$', new_entry_views, name='new_entry'),
    # 修改已有笔记
    re_path(r'^edit_entry/(?P<entry_id>\d+)/$', edit_entry_views, name='edit_entry'),
    # 删除笔记
    re_path(r'^delete_entry/(?P<entry_id>\d+)/$', delete_entry_views, name='delete_entry'),
    # 查询笔记
    re_path(r'^query_entry/$', query_entry_views, name='query_entry'),
    # 查询图书
    re_path(r'^query_book/$', query_book_views, name='query_book'),
    re_path(r'^query_book/bookZan.svg$', query_book_svg, name='query_book_svg'),
    # 用户行为分析
    re_path(r'^behavior_analysis/$', behavior_analysis_views, name='behavior_analysis'),
    re_path(r'^behavior_analysis/analysis.svg$', behavior_analysis_svg, name='behavior_analysis_svg'),
]

app_name = 'learning_logs'
