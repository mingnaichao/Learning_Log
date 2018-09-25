from django.shortcuts import render
from django.http import HttpResponseRedirect
from django.urls import reverse
from django.contrib.auth import logout, login, authenticate
from .forms import RegisterForm


# Create your views here.
def logout_views(request):
    '''注销用户'''
    logout(request)
    return HttpResponseRedirect(reverse('learning_logs:index'))


def register_views(request):
    '''注册新用户'''
    if request.method == 'GET':
        # 显示空的注册表单
        form = RegisterForm()
    else:
        # 处理填写好的表单
        form = RegisterForm(request.POST)
        # 验证数据是否通过验证，用户名未包含非法字符，输入的两个密码相同
        if form.is_valid():
            # 将用户名和散列值保存到数据库中，返回新创建的用户对象
            new_user = form.save()
            # 让用户自动登录，使用authenticate方法验证用户名和密码，返回一个通过了身份验证的对象
            authenticated_user = authenticate(username=new_user.username, password=request.POST['password1'])
            login(request, authenticated_user)
            # 重定向到主界面
            return HttpResponseRedirect(reverse('learning_logs:index'))
    return render(request, 'users/register.html', locals())
