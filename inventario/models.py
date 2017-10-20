from django.db import models
# Create your models here.

class Company(models.Model):
    class Meta:
        verbose_name = ("Empresa")
    name = models.CharField(max_length=500, verbose_name="nombre")
    nit = models.CharField(max_length=500, verbose_name="nit")
    address = models.CharField(max_length=500, verbose_name="dirección", blank=True, null=True)
    telephone = models.CharField(max_length=15, verbose_name="teléfono", blank=True, null=True)
    person_contact = models.CharField(max_length=500, verbose_name="persona de contacto", blank=True, null=True)
    photo = models.ImageField(upload_to='company/img', verbose_name="imagen", blank=True, null=True)
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
