FROM ahri/nodejs:0.0.1

ADD package.json /

RUN apk add --update python=2.7.10-r1 make=4.1-r0 g++=4.9.2-r5 && \
    npm install && \
    apk del python make g++ && \
    rm -rf /var/cache/apk/*

RUN mkdir /home/nobody && \
    chown nobody:nogroup /home/nobody

EXPOSE 4873
ENTRYPOINT su -s "/bin/sh" -c "cd /home/nobody && /node_modules/sinopia/bin/sinopia -l 0.0.0.0:4873" nobody
