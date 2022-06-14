FROM ghcr.io/girder/large_image:latest

RUN apt-get update && \
    apt-get install --no-install-recommends --yes \
        libpq-dev gcc libc6-dev \
        && \
    rm -rf /var/lib/apt/lists/*

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY setup.py /opt/django-project/setup.py
WORKDIR /opt/django-project
RUN rm -rf /opt/django-project/data && mkdir /opt/django-project/data

RUN pip install \
  --find-links https://girder.github.io/large_image_wheels \
  -e .

# RUN /opt/django-project/manage.py migrate
# RUN /opt/django-project/manage.py collectstatic --noinput
# RUN DJANGO_SUPERUSER_PASSWORD=password /opt/django-project/manage.py createsuperuser --noinput --username 'admin' --email 'admin@kitware.com'

# Test before finishing build
# RUN DJANGO_SETTINGS_MODULE=raster.settings pytest -v

# EXPOSE 8000
# ENTRYPOINT ["./manage.py", "runserver", "0.0.0.0:8000"]
# ENTRYPOINT ["gunicorn", "-k", "gthread", "--threads", "8", "--bind", "0.0.0.0:8000", "rasters.wsgi"]
