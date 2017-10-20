

MODULES_LIST = {'dashboard': {'txt':'Dashboard','icon':'icon_house_alt'},
                'inventario': {'txt':'Inventario','icon':'fa fa-cubes'},
                'tickets': {'txt':'Tickets','icon':'fa fa-bug'},
                'calendario': {'txt':'Calendario','icon':'icon_table'}
                }

                
def get_breadcrumbs_from_url(url):
    breadcrumbs = []
    breadcrumb = ''
    breadcrumb_concat = ''

    for breadcrumb in url.split('/'):
        if breadcrumb.strip():
            breadcrumb_concat = breadcrumb_concat + '/' + breadcrumb
            breadcrumbs.append({ 'txt':(MODULES_LIST.get(breadcrumb) or {}).get('txt'), 
                'icon':(MODULES_LIST.get(breadcrumb) or {}).get('icon') , 
                'url': breadcrumb_concat })

    return breadcrumbs