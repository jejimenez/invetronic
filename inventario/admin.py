from django.contrib import admin

# Register your models here.

from .models import Machine, Company

class MachineAdmin(admin.ModelAdmin):
    # A template for a customized change view:
    readonly_fields = ('machine_sequence',)
    change_form_template = 'admin/machine/change_form.html'

class CompanyAdmin(admin.ModelAdmin):
    # A template for a customized change view:
    exclude = ('photo_thumbnail1',)
    list_display = ('name', 'nit', 'address','telephone','cellphone','legal_representative')


admin.site.register(Machine, MachineAdmin)
admin.site.register(Company, CompanyAdmin)
