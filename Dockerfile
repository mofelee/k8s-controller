FROM alpine

ENV KUBE_LATEST_VERSION="v1.12.2"
ENV HELM_LATEST_VERSION="v2.11.0"

RUN apk add --update ca-certificates \
 && apk add --update -t deps curl wget \
 && curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
 && chmod +x /usr/local/bin/kubectl \
 && wget https://storage.googleapis.com/kubernetes-helm/helm-${HELM_LATEST_VERSION}-linux-amd64.tar.gz \
 && tar -xvf helm-${HELM_LATEST_VERSION}-linux-amd64.tar.gz \
 && mv linux-amd64/helm /usr/local/bin \
 && rm -f /helm-${HELM_LATEST_VERSION}-linux-amd64.tar.gz \
 && rm -rf linux-amd64\
 && apk del --purge deps \
 && rm /var/cache/apk/*

WORKDIR /root
