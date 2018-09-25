# Generated by Django 2.0.3 on 2018-04-07 03:46

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='email',
            field=models.EmailField(error_messages={'unique': '该邮箱地址已被注册。'}, max_length=254, unique=True, verbose_name='邮箱'),
        ),
    ]