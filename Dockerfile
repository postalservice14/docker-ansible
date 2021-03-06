FROM ubuntu:trusty
MAINTAINER John Kelly <john.m.kelly@cdk.com>

# Prevent dpkg errors
ENV TERM=xterm-256color

RUN apt-get update && \
    apt-get install -qy software-properties-common && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update -qy && \
    apt-get install -qy ansible

COPY ansible /ansible

VOLUME /ansible
WORKDIR /ansible

ENTRYPOINT ["ansible-playbook"]
CMD ["site.yml"]
