mkdir -p /usr/local/etc/nginx/sites-enabled                        
% cd /usr/local/etc/nginx/sites-enabled
% ln -s ../sites-available/default.conf
% ln -s ../sites-available/default-ssl.conf

include servers/*;
#include /usr/local/etc/nginx/site-enabled/*.conf;
#include /usr/local/etc/nginx/site-available/*.conf;

server {
            listen 9091;
            root /usr/local/var/www/html/wordpress;
            index index.php index.html;
            server_name localhost;
            access_log /usr/local/var/log/nginx/access.log;
            error_log /usr/local/var/log/nginx/error.log;
            location / {
                         try_files $uri $uri/ =404;
            }
            location ~ [^/]\.php(/|$) {
                fastcgi_split_path_info ^(.+?\.php)(/.*)$;
                if (!-f $document_root$fastcgi_script_name) {
                    return 404;
               }

                # Mitigate https://httpoxy.org/ vulnerabilities
                fastcgi_param HTTP_PROXY "";

                fastcgi_pass localhost:9090;
                fastcgi_index index.php;

                # include the fastcgi_param setting
                include fastcgi_params;

                # SCRIPT_FILENAME parameter is used for PHP FPM determining
                #  the script name. If it is not set in fastcgi_params file,
                # i.e. /etc/nginx/fastcgi_params or in the parent contexts,
                # please comment off following line:
                # fastcgi_param  SCRIPT_FILENAME   $document_root$fastcgi_script_name;
            }
            location ~ /\.ht {
                         deny all;
            }
            location = /favicon.ico {
                         log_not_found off;
                         access_log off;
            }
            location = /robots.txt {
                         allow all;
                         log_not_found off;
                         access_log off;
           }
            location ~* \.(js|css|png|jpg|jpeg|gif|ico)$ {
                         expires max;
                         log_not_found off;
           }
}
