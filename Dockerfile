FROM ubuntu:focal AS base
WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common curl git build-essential && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
git@github.com:marko154/ansible.gitgit@github.com:marko154/ansible.gitgit@github.com:marko154/ansible.gitgit@github.com:marko154/ansible.gitgit@github.com:marko154/ansible.gitgit@github.com:marko154/ansible.gitgit@github.com:marko154/ansible.git    apt-get install -y curl git ansible build-essential && \
    apt-get clean autoclean && \
    apt-get autoremove --yes

FROM base AS prime
ARG TAGS
RUN addgroup --gid 1000 marko
RUN adduser --gecos marko --uid 1000 --gid 1000 --disabled-password marko
USER marko
WORKDIR /home/marko

FROM prime
COPY . .
CMD ["sh", "-c", "ansible-playbook $TAGS local.yml"]

