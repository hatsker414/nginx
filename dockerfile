FROM nginx:1.21.6-alpine
COPY nginx.conf /etc/nginx/
COPY /img/dev.jpg /var/www/html/

RUN echo '<html><h3 align=center>Devops9</h3><p align=center><img src="dev.jpg"></p><p align=center><i>Author: anonymus</i></p></html>' > /var/www/html/index.html &&\
    chown -R nginx:nginx /var/www &&\
    chmod -R 644 /var/www/html/*

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 80
EXPOSE 443

STOPSIGNAL SIGQUIT

CMD ["nginx", "-g", "daemon off;"]
