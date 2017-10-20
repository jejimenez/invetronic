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

from common import utils


def machine_detail_view(request, pk_machine):
    #qs = Machine.objects.filter(id=1).values('id', 'name')
    #print(Machine.objects.filter(id=1).values())
    machine = Machine.objects.select_related('company').get(pk=pk_machine)
    #machines = Machine.objects.get()
    company = machine.company
    #data = serializers.serialize("json", Machine.objects.filter(id=1), use_natural_keys=True)
    doctype = 'pdf'
    machine_context = model_to_dict(machine,
    fields = ['id','name','company'])
    company_context = model_to_dict(company,
    fields = ['id','name','photo','address','telephone'])
    context = {**machine_context, 'company':{**company_context}}
    print(context)
    filename = fill_template(
        'inventario/machine_detail.odt', context,
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