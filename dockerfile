FROM centos:latest

RUN yum install -y pcre-devel openssl-devel gcc curl
RUN yum install -y yum-utils
RUN yum-config-manager --add-repo https://openresty.org/package/centos/openresty.repo
RUN yum install -y openresty openresty-resty