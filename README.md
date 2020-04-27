# vestacp-flask-start-app
# Overview

This package helps to run Flask applications on the Nginx server in Vesta CP.

## Installation ##

```
sudo apt install python3-pip python3-venv -y
git clone https://github.com/bursov/vestacp-flask-start-app.git
cd vestacp-flask-start-app
cp ./templates/* /usr/local/vesta/data/templates/web/nginx/php-fpm
chmod 755 usr/local/vesta/data/templates/web/nginx/php-fpm/wsgi_flask_nginx.sh
cd ..
rm -rf vestacp-flask-start-app
```

That's all. Now open Vesta CP. Edit domain on page "Web" - in "Template WEB" select "wsgi_flask_nginx" and press "Save".

## Upload Flask app ##

Go to folder "$home_dir/$user/web/$domain/private/" (replace variables with your actual data) and upload / clone your project here.

If you need to install new packages via pip, use current command

```
source venv/bin/activate; pip install -r requirements.txt; deactivate
```

Don't forget to upload valid "requirements.txt" file. 

By default in virtual enviroment installed Flask and gunicorn packages (with depencies)

Default entry point: app.py
