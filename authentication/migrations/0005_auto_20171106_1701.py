# -*- coding: utf-8 -*-
# Generated by Django 1.11.6 on 2017-11-06 22:01
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('authentication', '0004_auto_20171105_2137'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='tipo_usuario',
            field=models.CharField(blank=True, choices=[('TECNICO', 'Técnico'), ('CLIENTE_ADMIN', 'Cliente Administrador'), ('CLIENTE', 'Cliente')], max_length=100, null=True, verbose_name='tipo_usuario'),
        ),
    ]
