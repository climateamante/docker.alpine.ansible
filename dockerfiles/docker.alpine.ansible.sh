FROM alpine:3.6
MAINTAINER researchranks.com

# create app directories
RUN mkdir -p /var/www/app
WORKDIR /var/www/app

RUN apk --update --no-cache add \
		ca-certificates \
		curl \
		git \
		libcurl \
		openssh \
		openssl \
		openssl \
		perl \
		py2-pip \
		py-crypto \
		py-dnspython \
		py-httplib2 \
		py-jinja2 \
		py-netaddr \
		py-paramiko \
		py-pip \
		py-psycopg2 \
		py-setuptools \
		py-simplejson \
		python \
		py-yaml \
		rsync \
		sshpass \		
		&& \
		apk add --no-cache --repository \
		http://dl-3.alpinelinux.org/alpine/edge/testing/  \
		py-netifaces \
		py-msgpack \
		&& \
		apk --update add --virtual build-dependencies \
		build-base \
		libffi-dev \
		openssl-dev \
		python-dev \
		curl-dev \
		&& rm -rf /var/cache/apk/*

# Needed for pycurl
ENV PYCURL_SSL_LIBRARY=openssl

RUN pip install --upgrade \
		cffi \
		linode-python \
		pycurl \
		setuptools

RUN pip install --upgrade pip

RUN	pip install ansible==2.4.2  && \
	apk del build-dependencies	&& \
	rm -rf /var/cache/apk

RUN mkdir /etc/ansible/


# default settings for ansible host settings
RUN echo "[local]" > /etc/ansible/hosts ; echo "localhost ansible_connection=local" >> /etc/ansible/hosts
RUN mkdir /opt/ansible/ -p

