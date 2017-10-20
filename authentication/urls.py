from django.conf.urls import url
from django.contrib import admin
from django.contrib.auth import views as auth_views
from authentication import views

urlpatterns = [
    url(r'^$', auth_views.LoginView.as_view(redirect_authenticated_user=True), name='login'),
    url(r'^logout/$', auth_views.logout, {'next_page': '/'}, name='logout'),
    url(r'^dashboard/$', views.IndexView.as_view(), name='dashboard'),
]