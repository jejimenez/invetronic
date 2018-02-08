from django.contrib import admin

# Register your models here.

from .models import Machine, Company, HardwareComponent, HardwareComponentType, SoftwareComponent, SoftwareComponentType


from django.contrib.admin.widgets import AdminFileWidget
from django.utils.translation import ugettext as _
from django.utils.safestring import mark_safe
from django.contrib import admin



class AdminImageWidget(AdminFileWidget):
    def render(self, name, value, attrs=None):
        output = []
        if value and getattr(value, "url", None):
            image_url = value.url
            file_name = str(value)
            output.append(u'<a href="%s" target="_blank"><img src="%s" alt="%s" /></a>' % \
                          (image_url, image_url, file_name))
        #output.append(super(AdminFileWidget, self).render(name, value, attrs))
        return mark_safe(u''.join(output))


class ImageWidgetAdmin(admin.ModelAdmin):
    image_fields = []

    def formfield_for_dbfield(self, db_field, **kwargs):
        if db_field.name in self.image_fields:
            request = kwargs.pop("request", None)
            kwargs['widget'] = AdminImageWidget
            return db_field.formfield(**kwargs)
        return super(ImageWidgetAdmin, self).formfield_for_dbfield(db_field, **kwargs)



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

class CompanyAdmin(ImageWidgetAdmin):
    # A template for a customized change view:
    image_fields = ['photo_thumbnail1',]
    #exclude = ('photo_thumbnail1',)
    list_display = ('id','name', 'nit', 'dv', 'address','telephone','cellphone','legal_representative')
    #def render_change_form(self, request, context, *args, **kwargs):
        #context['adminform'].form.fields['someField'].help_text = "Ir a Editar " + str(context['original'].anyFunction()) + " (descarta cambios)"
        #print('rendering')
        #print(vars(kwargs['obj']))
        #if kwargs['obj'].photo:
        #    print(kwargs['obj'].photo.url)
        #if kwargs['obj'].photo_thumbnail1:
        #    print(kwargs['obj'].photo_thumbnail1.url)
        #return super(CompanyAdmin, self).render_change_form(request, context, args, kwargs)

admin.site.register(Machine, MachineAdmin)
admin.site.register(Company, CompanyAdmin)
admin.site.register(HardwareComponentType)
admin.site.register(SoftwareComponentType)
