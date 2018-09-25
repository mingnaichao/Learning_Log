from django.urls import re_path
from django.contrib.auth.views import login  # 导入默认视图login
from django.contrib.auth.views import password_change, password_change_done, password_reset, password_reset_done, \
    password_reset_confirm, password_reset_complete  # 认证系统所需的视图
from .views import logout_views, register_views

urlpatterns = [
    # 登录、退出、注册
    re_path(r'^login/$', login, {'template_name': 'users/login.html'}, name='login'),
    re_path(r'^logout/$', logout_views, name='logout'),
    re_path(r'^register/$', register_views, name='register'),

    # 修改密码
    re_path(r'^password_change/$', password_change, {'template_name': 'users/password_change.html'},
            name='password_change'),
    re_path(r'^password_change/done/$', password_change_done, {'template_name': 'users/password_change_done.html'},
            name='password_change_done'),

    # 重置密码
    re_path(r'^password_reset/$', password_reset, {'template_name': 'users/password_reset.html'},
            name='password_reset'),
    re_path(r'^password_reset/done/$', password_reset_done, {'template_name': 'users/password_reset_done.html'},
            name='password_reset_done'),

    # 收到邮件后，点击链接进行修改密码
    re_path(r'^reset/(?P<uidb64>[0-9A-Za-z_\-]+)/(?P<token>[0-9A-Za-z]{1,13}-[0-9A-Za-z]{1,20})/$',
            password_reset_confirm,
            {'template_name': 'users/password_reset_confirm.html'}, name='password_reset_confirm'),
    re_path(r'^reset/done/$', password_reset_complete,
            {'template_name': 'users/password_reset_complete.html'}, name='password_reset_complete'),
]
# 为urls设置命名空间
app_name = 'users'
