from django.shortcuts import render

from io import BytesIO
from django.http import HttpResponse
from django.core import serializers
from django.forms.models import model_to_dict
from django.views.generic.list import ListView
from django.utils import timezone

from templated_docs_adecuated import fill_template
from templated_docs_adecuated.http import FileResponse

from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator

from inventario.models import Machine
from PIL import Image as Img

from common import utils


def machine_detail_view(request, pk_machine):
    print(request.user.username)
    print(request.user.first_name)
    print(request.user.last_name)
    print(request.user.email)
    
    machine = Machine.objects.select_related('company').get(pk=pk_machine)
    company = machine.company
    doctype = 'pdf'
    machine_context = model_to_dict(machine,
    fields = ['id','name','company','machine_sequence'])
    company_context = model_to_dict(company,
    fields = ['id','name','photo_thumbnail1','address','telephone'])
    company_context['name'] = str.upper(company_context['name'])
    context = {**machine_context, 'company':{**company_context}}
    if request.user.is_authenticated:
        context['user'] = {'label':'Usuario', 'name':request.user.first_name+" "+request.user.last_name}
    else:
        context['user'] = {'label':'', 'name':''}
    print(context)
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
        #print(self.request.user)
        return context

    @method_decorator(login_required)
    def dispatch(self, *args, **kwargs):
        return super(MachineListView, self).dispatch(*args, **kwargs)