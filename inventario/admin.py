from django.contrib import admin

# Register your models here.

from .models import Machine, Company, HardwareComponent, HardwareComponentType, SoftwareComponent, SoftwareComponentType


class SoftwareComponentInLine(admin.TabularInline):
    model = SoftwareComponent
    #exclude = ('machine',)
    fields = ('component_type', 'name', 'release','compilation','bits','features',)


class HardwareComponentInLine(admin.TabularInline):
    model = HardwareComponent
    #exclude = ('machine',)
    fields = ('component_type', 'brand', 'model','serie','size','features',)

class MachineAdmin(admin.ModelAdmin):
    # A template for a customized change view:
    readonly_fields = ('machine_sequence',)
    change_form_template = 'admin/machine/change_form.html'
    list_display = ('name','company','ip','mac_address','os',)
    inlines = [
        HardwareComponentInLine,SoftwareComponentInLine
    ]

class CompanyAdmin(admin.ModelAdmin):
    # A template for a customized change view:
    exclude = ('photo_thumbnail1',)
    list_display = ('name', 'nit', 'address','telephone','cellphone','legal_representative')




admin.site.register(Machine, MachineAdmin)
admin.site.register(Company, CompanyAdmin)
admin.site.register(HardwareComponentType)
admin.site.register(SoftwareComponentType)
