FROM ubuntu:focal AS base
WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y sudo software-properties-common curl git build-essential && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y curl git ansible build-essential && \
    apt-get clean autoclean && \
    apt-get autoremove --yes

FROM base AS marko
ARG TAGS
# RUN addgroup --gid 1000 marko
# RUN adduser --gecos marko --uid 1000 --gid 1000 --disabled-password marko

ENV USER="marko"
RUN useradd -m ${USER}
RUN adduser ${USER} sudo
RUN echo "${USER} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/sudoers

USER marko
WORKDIR /home/marko

FROM marko
COPY . .
CMD ["sh", "-c", "ansible-playbook $TAGS local.yml"]
