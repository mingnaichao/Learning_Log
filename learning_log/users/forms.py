from django.contrib.auth.forms import UserCreationForm
from .models import User


class RegisterForm(UserCreationForm):
    class Meta(UserCreationForm.Meta):
        # 指定关联的models类
        model = User
        # 允许生成表单控件的字段
        fields = ['username', 'email']
