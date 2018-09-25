from django import forms
from .models import *


class TopicForm(forms.ModelForm):
    '''此表单用来创建、修改标题'''

    class Meta:
        # 指定关联的models类
        model = Topic
        # 声明允许生成表单控件的属性
        fields = ['text']
        # 指定每个属性对应的控件前的标签文本
        labels = {
            'text': '',
        }


class EntryForm(forms.ModelForm):
    '''此表单用来创建、修改笔记'''

    class Meta:
        model = Entry
        fields = ['text']
        labels = {
            'text': '',
        }
        # 指定小部件，并指定html属性
        widgets = {
            'text': forms.Textarea(
                attrs={
                    'cols': 80,  # 将多行文本域的宽度设置为80列
                }),
        }


class QueryForm(forms.ModelForm):
    '''此表单关联topic纯属为了使用文本输入框，用来获取用户输入的关键词'''

    class Meta:
        # 指定关联的models类
        model = Topic
        # 声明允许生成表单控件的属性
        fields = ['text']
        # 指定每个属性对应的控件前的标签文本
        labels = {
            'text': '',
        }
