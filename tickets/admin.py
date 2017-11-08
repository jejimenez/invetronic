from django.contrib import admin
from tickets.models import Incident
from django import forms
# Register your models here.

class IncidentForm( forms.ModelForm ):
    remote_diagnosis = forms.CharField( widget=forms.Textarea(attrs={'rows': 5, 'cols': 100}))
    phone_diagnosis = forms.CharField( widget=forms.Textarea(attrs={'rows': 5, 'cols': 100}))
    visit_diagnosis = forms.CharField( widget=forms.Textarea(attrs={'rows': 5, 'cols': 100}))
    
    #remote_diagnosis = forms.CharField( widget=forms.Textarea )
    class Meta:
        model = Incident
        fields = '__all__'

class IncidentAdmin( admin.ModelAdmin ):
    form = IncidentForm

admin.site.register(Incident,IncidentAdmin)