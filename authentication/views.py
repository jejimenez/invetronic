from django.shortcuts import render
from django.views.generic import TemplateView
from django.utils.decorators import method_decorator
from django.contrib.auth.decorators import login_required

from common import utils

# Create your views here.
class IndexView(TemplateView):
    template_name = "index.html"
    def get_context_data(self, **kwargs):
        context = super(IndexView, self).get_context_data(**kwargs)
        context['page_title'] = 'Dashboard'
        context['breadcrumbs'] = utils.get_breadcrumbs_from_url(self.request.get_full_path())
        return context
    @method_decorator(login_required)
    #@login_required()
    def dispatch(self, *args, **kwargs):
        return super(IndexView, self).dispatch(*args, **kwargs)