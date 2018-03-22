from django.db import models

from authentication.models import User
from inventario.models import Machine

# Create your models here.
class Incident(models.Model):
    class Meta:
        verbose_name = ("Incidente")

    BUG_STATUS = (
        ('O','Abierto'),
        ('C','Cerrado'),
    )

    BUG_SEVERITY = (
        ('5','Grave'),
        ('4','Importante'),
        ('3','Medio'),
        ('2','Simple'),
        ('1','Mínimo'),
        ('0','Sin Clasificar'),
    )

    user = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name="usuario", related_name='usuario', blank=False, null=False)
    machine = models.ForeignKey(Machine, on_delete=models.CASCADE, verbose_name="maquina", related_name='maquina', blank=False, null=False)
    overview = models.CharField(max_length=100, verbose_name="resumen", blank=False, null=False)
    description = models.TextField(max_length=1500, verbose_name="descripción", blank=False, null=False)

    remote_diagnosis = models.TextField(max_length=1500, verbose_name="diagnóstico remoto", blank=True, null=True)
    phone_diagnosis = models.TextField(max_length=1500, verbose_name="diagnóstico teléfono", blank=True, null=True)
    visit_diagnosis = models.TextField(max_length=1500, verbose_name="diagnóstico visita", blank=True, null=True)

    creation_time = models.DateTimeField(auto_now_add=True,verbose_name="fecha de creacion",blank=False, null=False)

    severity = models.CharField(max_length=1,choices=BUG_SEVERITY,default='0',verbose_name="gravedad", blank=False, null=False)
    status = models.CharField(max_length=1,choices=BUG_STATUS,default='O',verbose_name="estado", blank=True, null=True)

    def __str__(self):
        return self.overview

    def __unicode__(self):
        return self.overview