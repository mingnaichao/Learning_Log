# Generated by Django 2.0.3 on 2018-05-05 15:05

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0006_auto_20180505_2304'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='user',
            options={'verbose_name': 'user', 'verbose_name_plural': '用户列表'},
        ),
    ]