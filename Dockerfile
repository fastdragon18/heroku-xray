FROM teddysun/xray
RUN apk add --no-cache acme.sh socat gettext nginx \
 && echo "Hello World" > /var/www/index.html \
 && curl -sSL https://github.com/cloudflare/wrangler/releases/download/v1.18.0/wrangler-v1.18.0-x86_64-unknown-linux-musl.tar.gz | tar zxf - \
 && mv dist/wrangler /usr/bin/ \
 && rm -rf dist/
ADD config_client /xray/client/
ADD config.json /xray/config.json
ADD entrypoint.sh /
CMD /entrypoint.sh
