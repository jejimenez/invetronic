from django.shortcuts import render

from io import BytesIO
from django.http import HttpResponse
from django.core import serializers
from django.forms.models import model_to_dict
from django.views.generic.list import ListView
from django.views.generic import DetailView
from django.utils import timezone

from templated_docs_adecuated import fill_template
from templated_docs_adecuated.http import FileResponse

from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator

from inventario.models import Machine, HardwareComponent, SoftwareComponent, Shared, Printer
from authentication.models import TIPO_USUARIO
from PIL import Image as Img

from common import utils


def machine_detail_view(request, pk_machine):
    #print(request.user.username)
    #print(request.user.first_name)
    #print(request.user.last_name)
    #print(request.user.email)
    
    machine = Machine.objects.select_related('company').get(pk=pk_machine)
    company = machine.company
    # fetching hardware components to append in context file
    component = HardwareComponent.objects.filter(machine=machine)
    component_context = []
    i = 1
    for comp in component:
        component_context.append({'component_type':comp.component_type or "", 'brand':comp.brand or "", 'model':comp.model or "",
            'serie':comp.serie or "", 'size':comp.size or "", 'features':comp.features or ""})
    # fetching software components to append in context file
    component = SoftwareComponent.objects.filter(machine=machine)
    swcomponent_context = []
    i = 1
    for comp in component:
        swcomponent_context.append({'component_type':comp.component_type or "", 'name':comp.name or "", 'release':comp.release or "",
            'bits':comp.bits or "", 'compilation':comp.compilation or "", 'features':comp.features or ""})
    # fetching shared  to append in context file
    component = Shared.objects.filter(machine=machine)
    shared_context = []
    i = 1
    for comp in component:
        shared_context.append({'description':comp.description or ""})
    # fetching shared  to append in context file
    component = Printer.objects.filter(machine=machine)
    printer_context = []
    i = 1
    for comp in component:
        printer_context.append({'description':comp.description or ""})

    doctype = 'pdf'
    machine_context = model_to_dict(machine)
    company_context = model_to_dict(company,
    fields = ['id','name','photo_thumbnail1','address','telephone'])
    company_context['name'] = str.upper(company_context['name'])
    
    #context = {}
    context = machine_context
    context['company'] = company_context
    #context = {**machine_context, 'company':{**company_context}}
    if request.user.is_authenticated:
        context['user'] = {'label':'Usuario', 'name':request.user.first_name+" "+request.user.last_name}
    else:
        context['user'] = {'label':'', 'name':''}
    context['components'] = component_context
    context['swcomponents'] = swcomponent_context
    context['shared'] = shared_context
    context['printer'] = printer_context
    #print(context)
    filename = fill_template(
        'inventario/machine_detail2.odt', context,
        output_format=doctype)
    visible_filename = 'machine.{}'.format(doctype)

    return FileResponse(filename, visible_filename)


class MachineListView(ListView):

    model = Machine

    def get_context_data(self, **kwargs):
        context = super(MachineListView, self).get_context_data(**kwargs)
        context['now'] = timezone.now()
        context['page_title'] = 'Inventario'
        context['breadcrumbs'] = utils.get_breadcrumbs_from_url(self.request.get_full_path())
        if self.request.user.is_superuser:
            context['object_list'] = Machine.objects.all()
        elif self.request.user.tipo_usuario == 'CLIENTE' or self.request.user.tipo_usuario == 'CLIENTE_ADMIN':
            context['object_list'] = Machine.objects.filter(company=self.request.user.company.pk)
        elif self.request.user.tipo_usuario == 'TECNICO': # falta implementar logica para buscar machinas asignadas a los tickets
            context['object_list'] = Machine.objects.filter(company=self.request.user.company.pk)
        else:
            context['object_list'] = []
        #print(self.request.__dict__)
        return context

    @method_decorator(login_required)
    def dispatch(self, *args, **kwargs):
        return super(MachineListView, self).dispatch(*args, **kwargs)


class MachineDetail(DetailView):

    model = Machine

    def get_context_data(self, **kwargs):
        # Call the base implementation first to get a context
        context = super(MachineDetail, self).get_context_data(**kwargs)
        context['page_title'] = 'Detalle Máquina'
        context['breadcrumbs'] = utils.get_breadcrumbs_from_url(self.request.get_full_path())
        # Add in a QuerySet of all the books
        context['SoftwareComponent'] = SoftwareComponent.objects.filter(machine=self.object.pk)
        context['HardwareComponent'] = HardwareComponent.objects.filter(machine=self.object.pk)
        return context

    @method_decorator(login_required)
    def dispatch(self, *args, **kwargs):
        return super(MachineDetail, self).dispatch(*args, **kwargs)