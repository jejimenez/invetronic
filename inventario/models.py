from django.db import models
# Create your models here.
from django.db.models.signals import post_save, post_delete, pre_save
from PIL import Image as Img
import io
import sys
import os, errno
from django.core.files.uploadedfile import InMemoryUploadedFile
from django.conf import settings
#from io import BytesIO

class Company(models.Model):
    class Meta:
        verbose_name = ("Empresa")
    name = models.CharField(max_length=500, verbose_name="nombre")
    nit = models.CharField(max_length=50, verbose_name="nit")
    address = models.CharField(max_length=500, verbose_name="dirección", blank=True, null=True)
    telephone = models.CharField(max_length=15, verbose_name="teléfono", blank=True, null=True)
    cellphone = models.CharField(max_length=15, verbose_name="celular", blank=True, null=True)
    legal_representative = models.CharField(max_length=500, verbose_name="representante legal", blank=True, null=True)
    photo = models.ImageField(upload_to='company/img', verbose_name="imagen", blank=True, null=True)
    photo_thumbnail1 = models.ImageField(upload_to='company/img', verbose_name="imagen 250x250", blank=True, null=True)

    def __str__(self):
        return self.name

    def __init__(self, *args, **kwargs):
        super(Company, self).__init__(*args, **kwargs)
        self.old_photo = self.photo
        self.old_photo_thumbnail1 = self.photo_thumbnail1

    def save(self, *args, **kwargs):
        if self.photo:
            self.photo.seek(0)
            bytes_img = io.BytesIO(self.photo.read())
            image = Img.open(bytes_img)
            image.thumbnail((250,250), Img.ANTIALIAS)
            output = io.BytesIO()
            image.save(output, format='JPEG', quality=75)
            output.seek(0)
            self.photo_thumbnail1= InMemoryUploadedFile(output,'ImageField', "%s_thumbnail1.jpg" %self.photo.name, 'image/jpeg', sys.getsizeof(output), None)
            if self.pk:
                try:
                    os.remove(settings.MEDIA_ROOT+self.old_photo.name)
                    os.remove(settings.MEDIA_ROOT+self.old_photo_thumbnail1.name)
                except OSError as e:
                    if e.errno != errno.ENOENT:
                        None
                    else:
                        print(e)
        super(Company, self).save(*args, **kwargs)


    #@classmethod
    #def create(self):
    #    book = cls(title=title)
    #    # do something with the book
    #    return book


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
    machine_sequence = models.CharField(max_length=200, verbose_name="número de secuencia", null=True)
    
    def __str__(self):
        return self.name
"""
    def save(self, *args, **kwargs):
        print('okkkkk')
        print(self.__dict__)
        return super(Machine, self).save(force_insert=True, *args, **kwargs)

    @staticmethod
    def pre_save(sender, instance, **kwargs):
        print('ok')
        delattr(instance, "shajred")
        
        print(instance.__dict__)
pre_save.connect(Machine.pre_save, Machine, dispatch_uid="inventario.models.Machine") 
"""
"""
class HardwareComponentType(models.Model):
    class Meta:
        verbose_name = ("Tipo de Component Hardware")
    nombre = models.CharField(max_length=200, verbose_name="nombre")

class HardwareComponent(models.Model):
    class Meta:
        verbose_name = ("Componente de Hardware")
    machine = models.ForeignKey(Machine, on_delete=models.CASCADE, verbose_name="máquina", related_name='máquina')
    component_type = models.ForeignKey(HardwareComponentType, on_delete=models.CASCADE, verbose_name="tipo de componente", related_name='tipo de componente')
    brand = models.CharField(max_length=200, verbose_name="marca")
    model = models.CharField(max_length=200, verbose_name="modelo")
    serie = models.CharField(max_length=200, verbose_name="serie")
    size = models.CharField(max_length=200, verbose_name="tamaño")
    features = models.CharField(max_length=500)


"""