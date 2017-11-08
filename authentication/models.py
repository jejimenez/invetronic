from django.contrib.auth.models import AbstractUser, PermissionsMixin
from django.db import models
from django.contrib.auth.models import BaseUserManager

from inventario.models import Company

# Create your models here.


TIPO_USUARIO = (
    ('TECNICO','Técnico'),
    ('CLIENTE_ADMIN','Cliente Administrador'),
    ('CLIENTE','Cliente'),
)


class UserManager(BaseUserManager):
    def create_superuser(self,username, password, **kwargs):
        user = self.model(username=username)
        user.set_password(password)

        user.is_admin = True
        user.is_staff = True
        user.is_superuser = True
        user.company_id = 1
        user.save()

        return user


class User(AbstractUser):
    company = models.ForeignKey(Company, on_delete=models.CASCADE, verbose_name="empresa", related_name='user_empresa', null=True, blank=True)    
    objects = UserManager()
    USERNAME_FIELD ='username'
    tipo_usuario = models.CharField(max_length=100,choices=TIPO_USUARIO,blank=True,null=True,verbose_name="tipo_usuario")