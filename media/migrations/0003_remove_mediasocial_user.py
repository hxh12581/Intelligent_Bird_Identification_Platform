# Generated by Django 3.2.9 on 2024-05-15 08:46

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('media', '0002_auto_20240515_1639'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='mediasocial',
            name='user',
        ),
    ]
