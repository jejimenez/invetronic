from django.contrib import admin

# Register your models here.

from .models import Machine, Company

class MachineAdmin(admin.ModelAdmin):
    # A template for a customized change view:
    change_form_template = 'admin/machine/change_form.html'


admin.site.register(Machine, MachineAdmin)
admin.site.register(Company)
