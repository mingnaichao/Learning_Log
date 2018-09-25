"""learning_log URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import re_path, include

urlpatterns = [
    re_path(r'admin/', admin.site.urls),
]
urlpatterns += [
    re_path(r'^', include('learning_logs.urls', namespace='learning_logs')),
    # 设置路由，创建命名空间users，以便将应用learning_logs的url与users的url区分开来
    re_path(r'^users/', include('users.urls', namespace='users')), 
    # django自带的登录、修改密码、找回密码等视图函数对应的URL模式，将auth应用中的urls模块包含进来
    re_path(r'^users/', include('django.contrib.auth.urls')),
]

admin.autodiscover()
from django.contrib.staticfiles.urls import staticfiles_urlpatterns

urlpatterns += staticfiles_urlpatterns()
