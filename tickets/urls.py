"""invetronic URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
from tickets import views


urlpatterns = [
    # ex: /inventario/2/printmachine/
    url(r'^$', views.IncidentListView.as_view(), name='incident_list'),
    url(r'^new$', views.IncidentCreate.as_view(success_url="/tickets/"), name='incident_new', ),
    #url(r'^machine/(?P<pk>[0-9]+)/$', views.MachineDetail.as_view(), name='machine_detail'),
    
]
