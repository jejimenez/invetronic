# -*- coding: utf-8 -*-
# Generated by Django 1.11.6 on 2017-10-26 01:16
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('inventario', '0001_company_photo_thumbnail1'),
    ]

    operations = [
        migrations.CreateModel(
            name='HardwareComponent',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('brand', models.CharField(max_length=200, verbose_name='marca')),
                ('model', models.CharField(max_length=200, verbose_name='modelo')),
                ('serie', models.CharField(max_length=200, verbose_name='serie')),
                ('size', models.CharField(max_length=200, verbose_name='tamaño')),
                ('features', models.CharField(max_length=500, verbose_name='características')),
            ],
            options={
                'verbose_name': 'Componente de Hardware',
            },
        ),
        migrations.CreateModel(
            name='HardwareComponentType',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=200, verbose_name='nombre')),
            ],
            options={
                'verbose_name': 'Tipo de Component Hardware',
            },
        ),
        migrations.AlterField(
            model_name='company',
            name='photo_thumbnail1',
            field=models.ImageField(blank=True, null=True, upload_to='company/img', verbose_name='imagen 250x250'),
        ),
        migrations.AddField(
            model_name='hardwarecomponent',
            name='component_type',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='tipo_componente', to='inventario.HardwareComponentType', verbose_name='tipo_componente'),
        ),
        migrations.AddField(
            model_name='hardwarecomponent',
            name='machine',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='máquina', to='inventario.Machine', verbose_name='máquina'),
        ),
    ]
