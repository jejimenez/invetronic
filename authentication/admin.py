from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from authentication.models import User
# Register your models here.


class MyUserAdmin(UserAdmin):
    model = User
    #print(UserAdmin.fieldsets)
    #print(type(UserAdmin.fieldsets))
    fieldsets = UserAdmin.fieldsets + (
            (None, {'fields': ('company','tipo_usuario')}),
    )


admin.site.register(User, MyUserAdmin)


