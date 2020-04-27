#!/bin/bash
user="$1"
domain="$2"
ip="$3"
home_dir="$4"
docroot="$5"
tmpdir="./tmp"

cd $home_dir/$user/web/$domain/private/
python3 -m venv venv
git clone https://github.com/bursov/vestacp-flask-start-app $tmpdir
source venv/bin/activate

pip install -r $tmpdir/requirements.txt
# pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U

deactivate

chown $user:$user $tmpdir/app.py
chown $user:$user $tmpdir/wsgi.py

mv $tmpdir/app.py ./
mv $tmpdir/wsgi.py ./

# rm -rf $tmpdir

echo "For install requirements packs:
cd $home_dir/$user/web/$domain/private/; source venv/bin/activate; pip install -r $docroot/requirements.txt; deactivate
" > $docroot/help

echo "[program:$domain]
directory=$home_dir/$user/web/$domain/private/
command=$home_dir/$user/web/$domain/private/venv/bin/gunicorn app:app --reload --bind unix:$domain.sock
autostart=true
autorestart=true
stderr_logfile=$home_dir/$user/web/$domain/logs/gunicorn.err.log
stdout_logfile=$home_dir/$user/web/$domain/logs/gunicorn.out.log" > /etc/supervisor/conf.d/$domain.conf

supervisorctl reread
service supervisor restart

exit 0
