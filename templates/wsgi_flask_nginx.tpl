server {
    listen      %ip%:80;
    server_name %domain_idn% %alias_idn%;
    access_log  /var/log/nginx/domains/%domain%.log combined;
    error_log  /var/log/%web_system%/domains/%domain%.error.log error;
    location / {
        proxy_pass http://unix:%home%/%user%/web/%domain%/private/%domain%.sock;
    }

    location ^~ /static/  {
        include  /etc/nginx/mime.types;
        root %docroot%/;
    }

    location /error/ {
        alias   %home%/%user%/web/%domain%/document_errors/;
    }

    location @fallback {
        proxy_pass      http://%ip%:%web_port%;
    }

    location ~ /\.ht    {return 404;}
    location ~ /\.svn/  {return 404;}
    location ~ /\.git/  {return 404;}
    location ~ /\.hg/   {return 404;}
    location ~ /\.bzr/  {return 404;}

    disable_symlinks if_not_owner from=%docroot%;

    include %home%/%user%/conf/web/nginx.%domain%.conf*;
}
