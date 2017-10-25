# -*- coding: utf-8 -*-                                                                                                                                                                                             
# Generated by Django 1.9.4 on 2016-09-17 17:35                                                                                                                                                                     
from __future__ import unicode_literals                                                                                                                                                                             
                                                                                                                                                                                                                     
from django.db import migrations                                                                                                                                                                                    
                                                                                                                                                                                                                     
                                                                                                                                                                                                                     
class Migration(migrations.Migration):                                                                                                                                                                              
                                                                                                                                                                                                                     
    dependencies = [                                                                                                                                                                                                
        ('inventario', '0001_company_machine'),                                                                                                                                                                                   
    ]

    operations = [
        migrations.RunSQL(
            "CREATE SEQUENCE machine_seq "+
            "INCREMENT 1 "+
            "MINVALUE 1 "+
            "MAXVALUE 99999 "+
            "START 1 "+
            "CACHE 1 "+
            "CYCLE; ",
            "DROP sequence machine_seq"
        ),
        migrations.RunSQL(
            "CREATE or REPLACE FUNCTION fn_machine_seq() RETURNS trigger AS $fn_machine_seq$ "+
            "BEGIN "+
            "NEW.machine_sequence := 'HV'||to_char(now(),'YYYYMMDD')||lpad(nextval('machine_seq'), 5, '0'); "+
            "RETURN NEW; "+
            "END; "+
            "$fn_machine_seq$ LANGUAGE plpgsql;",
            "DROP sequence if exists fn_machine_seq"
        ),
        migrations.RunSQL(
            "CREATE TRIGGER tg_machine_seq "+
            "BEFORE INSERT "+
            "ON inventario_machine "+
            "FOR EACH ROW "+
            "EXECUTE PROCEDURE fn_machine_seq();",
            "DROP TRIGGER if exists tg_machine_seq on inventario_machine"
        )
    ]