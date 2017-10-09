from django.db import models
# Create your models here.

class Company(models.Model):
    class Meta:
        verbose_name = ("Empresa")
    name = models.CharField(max_length=500, verbose_name="nombre")
    address = models.CharField(max_length=500, verbose_name="dirección")
    person_contact = models.CharField(max_length=500, verbose_name="persona de contacto")
    nit = models.CharField(max_length=500, verbose_name="nit")
    def __str__(self):
        return self.name

class Machine(models.Model):
    class Meta:
        verbose_name = ("Máquina")
    company = models.ForeignKey(Company, on_delete=models.CASCADE, verbose_name="empresa", related_name='empresa')
    name = models.CharField(max_length=200, verbose_name="nombre")
    ip = models.CharField(max_length=200)
    mac_address = models.CharField(max_length=200, verbose_name="mac address")
    shared = models.CharField(max_length=200, verbose_name="compartido")
    printers = models.CharField(max_length=200, verbose_name="impresoras")
    os = models.CharField(max_length=200, verbose_name="sistema operativo")
    def __str__(self):
        return self.name
