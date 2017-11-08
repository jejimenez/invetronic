# -*- coding: utf-8 -*-
# Generated by Django 1.11.6 on 2017-11-06 22:01
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('inventario', 'sequence'),
    ]

    operations = [
        migrations.AddField(
            model_name='machine',
            name='buyed_date',
            field=models.DateField(blank=True, null=True, verbose_name='fecha de compra'),
        ),
        migrations.AddField(
            model_name='machine',
            name='creation_time',
            field=models.DateTimeField(auto_now_add=True, null=True, verbose_name='fecha de compra'),
        ),
        migrations.AddField(
            model_name='machine',
            name='supplier',
            field=models.CharField(blank=True, max_length=200, null=True, verbose_name='proveedor'),
        ),
        migrations.AddField(
            model_name='machine',
            name='warranty_months',
            field=models.IntegerField(blank=True, null=True, verbose_name='Meses Garantía'),
        ),
    ]
