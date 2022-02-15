FROM alpine:latest

RUN apk add curl tar bash git --no-cache

RUN set -ex \
    && curl -sSL https://get.helm.sh/helm-v3.8.0-linux-amd64.tar.gz | tar xz \
    && mv linux-amd64/helm /usr/local/bin/helm \
    && rm -rf linux-amd64

# ENV HELM_PLUGINS=/root/.local/share/helm/plugins

RUN helm plugin install https://github.com/chartmuseum/helm-push --debug

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
