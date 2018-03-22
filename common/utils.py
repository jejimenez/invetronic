

MODULES_LIST = {'dashboard': {'txt':'Dashboard','icon':'icon_house_alt'},
                'inventario': {'txt':'Inventario','icon':'fa fa-cubes'},
                'tickets': {'txt':'Tickets','icon':'fa fa-bug'},
                'new': {'txt':'Nuevo','icon':'fa fa-plus'},
                'calendario': {'txt':'Calendario','icon':'icon_table'},
                'machine': {'txt':'Máquina','icon':'fa fa-desktop'}
                }

                
def get_breadcrumbs_from_url(url):
    breadcrumbs = []
    breadcrumb = ''
    breadcrumb_concat = ''
    #print(url.split('/'))
    breadcrumb_split = url.split('/')
    pk = ''
    i = 0
    for breadcrumb in breadcrumb_split:
        #print(str(i)+' -- '+breadcrumb_split[i]+' -- ')
        if breadcrumb.strip() and not breadcrumb.isdigit(): # si no está vacío y no es una llave primaria de un modelo
            if i < len(breadcrumb_split)-1:
                pk = ('','/'+breadcrumb_split[i+1])[breadcrumb_split[i+1].isdigit()]#si el siguiente es una llave, se anexa al actual
            #print(breadcrumb_split[i+1].isdigit())
            #print(pk)
            breadcrumb_concat = breadcrumb_concat + '/' + breadcrumb
            breadcrumbs.append({ 'txt':(MODULES_LIST.get(breadcrumb) or {}).get('txt'), 
                'icon':(MODULES_LIST.get(breadcrumb) or {}).get('icon') , 
                'url': breadcrumb_concat+pk })
        i += 1 
    

    """
    for breadcrumb in url.split('/'):
        if breadcrumb.strip():
            breadcrumb_concat = breadcrumb_concat + '/' + breadcrumb
            breadcrumbs.append({ 'txt':(MODULES_LIST.get(breadcrumb) or {}).get('txt'), 
                'icon':(MODULES_LIST.get(breadcrumb) or {}).get('icon') , 
                'url': breadcrumb_concat })
    """
    return breadcrumbs


def validate_file_extension(value):
    import os
    from django.core.exceptions import ValidationError
    ext = os.path.splitext(value.name)[1]  # [0] returns path+filename
    valid_extensions = ['.jpg','.png']
    if not ext.lower() in valid_extensions:
        raise ValidationError(u'El archivo no corresponde a una imagen jpg o png.')

