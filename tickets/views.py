from django.shortcuts import render
from tickets.models import Incident
from inventario.models import Machine

from django import forms
from django.contrib.admin.widgets import FilteredSelectMultiple


from django.views.generic.list import ListView
from django.views.generic import DetailView
from django.views.generic.edit import CreateView, UpdateView, DeleteView

from django.utils import timezone

from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator

from django.core.urlresolvers import reverse_lazy

from common import utils
# Create your views here.

class IncidentForm(forms.ModelForm):

    #machine = forms.TypedChoiceField(choices=Machine.objects.all(), coerce=int)

    class Meta:
        model = Incident
        fields = ['overview', 'description','machine']

    def __init__(self,user, *args, **kwargs):
        super(IncidentForm, self).__init__(*args, **kwargs)
        machine_size = (Machine.objects.filter(company=user.company.pk).count(),10)[Machine.objects.filter(company=user.company.pk).count()>10]
        #self.fields['machine'] = forms.ModelChoiceField(queryset=Machine.objects.filter(company=user.company.pk))
        self.fields['machine'] = forms.ModelChoiceField(queryset=Machine.objects.filter(company=user.company.pk),
            widget=FilteredSelectMultiple("verbose name", is_stacked=False, attrs={'size':machine_size}), empty_label="MÁQUINA")

"""  class Meta(object):
    model = Account
  parent = forms.ModelChoiceField(queryset=Machine.objects.filter(pk=))
"""
class IncidentCreate(CreateView):
    model = Incident
    form_class = IncidentForm
    success_url = reverse_lazy('books_cbv:book_list')

    def form_valid(self, form):
        form.instance.user = self.request.user
        return super(IncidentCreate, self).form_valid(form)

    def get_form_kwargs(self):
        kwargs = super(IncidentCreate, self).get_form_kwargs()
        kwargs.update({'user': self.request.user})
        return kwargs

    def get_context_data(self, **kwargs):
        context = super(IncidentCreate, self).get_context_data(**kwargs)
        context['now'] = timezone.now()
        context['page_title'] = 'Nuevo Incidente'
        context['breadcrumbs'] = utils.get_breadcrumbs_from_url(self.request.get_full_path())
        success_url = reverse_lazy('incident_list')  
        return context


class IncidentListView(ListView):

    model = Incident

    def get_context_data(self, **kwargs):
        context = super(IncidentListView, self).get_context_data(**kwargs)
        context['now'] = timezone.now()
        context['page_title'] = 'Tickets'
        context['breadcrumbs'] = utils.get_breadcrumbs_from_url(self.request.get_full_path())
        if self.request.user.is_superuser:
            context['object_list'] = Incident.objects.all()
        elif self.request.user.tipo_usuario == 'CLIENTE' or self.request.user.tipo_usuario == 'CLIENTE_ADMIN':
            context['object_list'] = Incident.objects.filter(user__company=self.request.user.company.pk)
        elif self.request.user.tipo_usuario == 'TECNICO': # falta implementar logica para buscar machinas asignadas a los tickets
            context['object_list'] = Incident.objects.filter(user__company=self.request.user.company.pk)
        else:
            context['object_list'] = []
        #print(self.request.__dict__)
        return context

    @method_decorator(login_required)
    def dispatch(self, *args, **kwargs):
        return super(IncidentListView, self).dispatch(*args, **kwargs)