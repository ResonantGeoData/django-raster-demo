from django.contrib.postgres.operations import CreateExtension
from django.db import migrations


class Migration(migrations.Migration):

    initial = True

    operations = [
        CreateExtension('postgis_raster'),
    ]
