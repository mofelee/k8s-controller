FROM alpine

ENV KUBE_LATEST_VERSION="v1.18.12"
ENV HELM_LATEST_VERSION="v3.4.1"

RUN apk add --update ca-certificates \
 && apk add --update -t deps curl wget \
 && curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
 && chmod +x /usr/local/bin/kubectl \
 && wget https://get.helm.sh/helm-${HELM_LATEST_VERSION}-linux-amd64.tar.gz \
 && tar -xvf helm-${HELM_LATEST_VERSION}-linux-amd64.tar.gz \
 && mv linux-amd64/helm /usr/local/bin \
 && rm -f /helm-${HELM_LATEST_VERSION}-linux-amd64.tar.gz \
 && rm -rf linux-amd64\
 && apk del --purge deps \
 && rm /var/cache/apk/*

WORKDIR /root
