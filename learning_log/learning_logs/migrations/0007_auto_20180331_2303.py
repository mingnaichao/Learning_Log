# Generated by Django 2.0.3 on 2018-03-31 15:03

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('learning_logs', '0006_entry_name'),
    ]

    operations = [
        migrations.AlterModelTable(
            name='entry',
            table='条目',
        ),
        migrations.AlterModelTable(
            name='topic',
            table='主题',
        ),
    ]
