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
