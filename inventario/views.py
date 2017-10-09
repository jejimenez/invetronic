from django.shortcuts import render

from io import BytesIO
from django.http import HttpResponse
from django.core import serializers
from django.forms.models import model_to_dict

from templated_docs import fill_template
from templated_docs.http import FileResponse

from inventario.models import Machine


def machine_detail_view(request, pk_machine):
    #qs = Machine.objects.filter(id=1).values('id', 'name')
    #print(Machine.objects.filter(id=1).values())
    machine = Machine.objects.select_related('company').get(pk=pk_machine)
    company = machine.company
    #data = serializers.serialize("json", Machine.objects.filter(id=1), use_natural_keys=True)
    doctype = 'PDF'
    machine_context = model_to_dict(machine,
    fields = ['id','name','company'])
    company_context = model_to_dict(company,
    fields = ['id','name'])
    context = {**machine_context, 'company':{**company_context}}
    print(context)
    #print(qs.__dict__)
    
    filename = fill_template(
        'inventario/machine_detail.odt', context,
        output_format=doctype)
    visible_filename = 'machine.{}'.format(doctype)

    return FileResponse(filename, visible_filename)



def write_pdf_view(request, machine_id):
    pass
    """
    response = HttpResponse(content_type='application/pdf')
    response['Content-Disposition'] = 'inline; filename="mypdf.pdf"'

    buffer = BytesIO()
    p = canvas.Canvas(buffer)

    # Start writing the PDF here
    p.drawString(100, 100, 'Hello world.')
    # End writing

    p.showPage()
    p.save()

    pdf = buffer.getvalue()
    buffer.close()
    response.write(pdf)

    return response"""