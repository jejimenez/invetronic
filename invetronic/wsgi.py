"""
WSGI config for invetronic project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/1.11/howto/deployment/wsgi/
"""

import os, sys

from django.core.wsgi import get_wsgi_application


path = '/srv/www/vhosts/dummy-host.example.com/invetronic'

if path not in sys.path:
    sys.path.append(path)
    

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "invetronic.settings")

application = get_wsgi_application()
