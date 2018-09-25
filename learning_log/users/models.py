from django.db import models
from django.contrib.auth.models import AbstractUser


# Create your models here.
class User(AbstractUser):
    # 增加昵称属性
    nickname = models.CharField(max_length=50, blank=True, verbose_name='昵称')
    # django里面的邮箱默认是可以复用的，在此设置邮箱的唯一性
    email = models.EmailField('邮箱', unique=True, error_messages={'unique': "该邮箱地址已被注册。"})
    # 设置用户状态，方便以后封号
    is_active = models.BooleanField(default=True, verbose_name='用户状态')

    class Meta(AbstractUser.Meta):
        pass
