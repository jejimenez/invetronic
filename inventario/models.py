from django.db import models
# Create your models here.
from django.db.models.signals import post_save, post_delete, pre_save
from PIL import Image as Img
import io, sys, os, errno, re
from django.core.files.uploadedfile import InMemoryUploadedFile
from django.conf import settings

from django.utils.translation import ugettext_lazy as _
from django.forms import fields
#from io import BytesIO

# MAC Address field
MAC_RE = r'^([0-9a-fA-F]{2}([:-]?|$)){6}$'
mac_re = re.compile(MAC_RE)

class MACAddressFormField(fields.RegexField):
    default_error_messages = {
        'invalid': _(u'Enter a valid MAC address.'),
    }

    def __init__(self, *args, **kwargs):
        super(MACAddressFormField, self).__init__(mac_re, *args, **kwargs)

class MACAddressField(models.Field):
    empty_strings_allowed = False
    def __init__(self, *args, **kwargs):
        kwargs['max_length'] = 17
        super(MACAddressField, self).__init__(*args, **kwargs)

    def get_internal_type(self):
        return "CharField"

    def formfield(self, **kwargs):
        defaults = {'form_class': MACAddressFormField}
        defaults.update(kwargs)
        return super(MACAddressField, self).formfield(**defaults)



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

    def __unicode__(self):
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
    ip = models.GenericIPAddressField(blank=True, null=True)
    mac_address = MACAddressField(verbose_name="mac address", blank=True, null=True)
    shared = models.CharField(max_length=200, verbose_name="compartido", blank=True, null=True)
    printers = models.CharField(max_length=200, verbose_name="impresoras", blank=True, null=True)
    os = models.CharField(max_length=200, verbose_name="sistema operativo", blank=True, null=True)
    machine_sequence = models.CharField(max_length=200, verbose_name="número de secuencia", blank=True, null=True)

    def __str__(self):
        return self.company.name+" "+self.name

    def __unicode__(self):
        return self.name

"""
    def save(self, *args, **kwargs):
        print('okkkkk')
        print(self.__dict__)
        return super(Machine, self).save( *args, **kwargs)

    @staticmethod
    def pre_save(sender, instance, **kwargs):
        print('ok')
        delattr(instance, "shajred")
        
        print(instance.__dict__)
pre_save.connect(Machine.pre_save, Machine, dispatch_uid="inventario.models.Machine") 
"""

class HardwareComponentType(models.Model):
    class Meta:
        verbose_name_plural = ("Tipos de Componente Hardware")
        verbose_name = ("Tipo de Componente Hardware")
    name = models.CharField(max_length=200, verbose_name="nombre")
    def __str__(self):
        return self.name

class HardwareComponent(models.Model):
    class Meta:
        verbose_name = ("Componente de Hardware")
    machine = models.ForeignKey(Machine, on_delete=models.CASCADE, verbose_name="máquina", related_name='hw_machine')
    component_type = models.ForeignKey(HardwareComponentType, on_delete=models.CASCADE, verbose_name="tipo_componente", related_name='hw_tipo_componente')
    brand = models.CharField(max_length=200, verbose_name="marca", null=True, blank=True)
    model = models.CharField(max_length=200, verbose_name="modelo", null=True, blank=True)
    serie = models.CharField(max_length=200, verbose_name="serie", null=True, blank=True)
    size = models.CharField(max_length=200, verbose_name="tamaño", null=True, blank=True)
    features = models.CharField(max_length=500, verbose_name="características", null=True, blank=True)
    
    def __str__(self):
        return self.machine.name + " - " +self.component_type.name

class SoftwareComponentType(models.Model):
    class Meta:
        verbose_name_plural = ("Tipos de Componente Software")
        verbose_name = ("Tipo de Componente Software")
    name = models.CharField(max_length=200, verbose_name="nombre")
    def __str__(self):
        return self.name

class SoftwareComponent(models.Model):
    class Meta:
        verbose_name = ("Componente de Software")
    machine = models.ForeignKey(Machine, on_delete=models.CASCADE, verbose_name="máquina", related_name='sw_machine')
    component_type = models.ForeignKey(SoftwareComponentType, on_delete=models.CASCADE, verbose_name="tipo_componente", related_name='sw_tipo_componente')
    name = models.CharField(max_length=200, verbose_name="nombre", null=True, blank=True)
    release = models.CharField(max_length=200, verbose_name="version", null=True, blank=True)
    compilation = models.CharField(max_length=200, verbose_name="compilación", null=True, blank=True)
    bits = models.CharField(max_length=200, verbose_name="bits", null=True, blank=True)
    features = models.CharField(max_length=500, verbose_name="características", null=True, blank=True)
    
    def __str__(self):
        return self.machine.name + " - " +self.component_type.name


