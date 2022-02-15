FROM plugins/base:linux-amd64

ENV XDG_DATA_HOME=/opt/xdg
ENV XDG_CACHE_HOME=/opt/xdg

RUN apk add curl tar bash git --no-cache

RUN set -ex \
    && curl -sSL https://get.helm.sh/helm-v3.8.0-linux-amd64.tar.gz | tar xz \
    && mv linux-amd64/helm /usr/local/bin/helm \
    && rm -rf linux-amd64

RUN helm plugin list
RUN helm plugin install https://github.com/chartmuseum/helm-push

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
