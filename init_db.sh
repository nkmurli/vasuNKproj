#!/bin/sh
echo "------ Create database tables ------"
python manage.py migrate --noinput

echo "------ create default admin user ------"
echo "from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'nkmurli99@gmail.com', 'Passw0rd')" | python manage.py shell

echo "------ starting gunicorn &nbsp;------"
gunicorn vasuapp.wsgi --workers 2