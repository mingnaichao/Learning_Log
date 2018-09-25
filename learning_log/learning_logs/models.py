from django.db import models
from users.models import User  # 导入模型User


# Create your models here.


class Topic(models.Model):
    """标题类对应topic表"""
    # 设置属性（表中字段）
    text = models.CharField(max_length=200, verbose_name='标题')  # 在数据库中最大预留200个字符
    date_added = models.DateTimeField(auto_now_add=True, verbose_name='创建时间')  # 设置创建时间
    owner = models.ForeignKey(User, null=True, on_delete=models.CASCADE)  # 建立到模型User的外键关系

    class Meta:
        db_table = 'topic'  # 数据库中的表名
        verbose_name_plural = '标题'  # 指定该类在admin后台中显示的名称

    def __str__(self):
        '''返回模型的字符串表示'''
        return self.text


class Entry(models.Model):
    '''笔记类对应entry表'''
    # 设置属性（表中字段）
    topic = models.ForeignKey(Topic, on_delete=models.CASCADE, verbose_name='标题', null=True)
    text = models.TextField(verbose_name='内容')
    # date_added作用：能够按照创建的顺序呈现条目，并且在每个条目旁边放置时间戳
    date_added = models.DateTimeField(auto_now_add=True, verbose_name='创建时间')
    owner = models.ForeignKey(User, null=True, on_delete=models.CASCADE)  # 建立到模型User的外键关系

    class Meta:
        db_table = 'entry'  # 数据库中的表名
        verbose_name_plural = '笔记'  # 指定该类在admin后台中显示的名称

    def __str__(self):
        '''返回模型的字符串表示'''
        # 只显示前20个字符
        return self.text[:20] + '...'


class History(models.Model):
    '''用户图书搜索历史'''
    date_added = models.DateTimeField(auto_now_add=True, verbose_name='搜索时间')
    text = models.CharField(max_length=100, verbose_name='搜索内容')
    num = models.IntegerField(verbose_name='搜索次数', default=1)
    owner = models.ForeignKey(User, null=True, on_delete=models.CASCADE)  # 建立到模型User的外键关系

    class Meta:
        db_table = 'history'  # 数据库中的表名
        verbose_name_plural = '图书搜索历史'  # 指定该类在admin后台中显示的名称

    def __str__(self):
        '''返回模型的字符串表示'''
        return self.text
