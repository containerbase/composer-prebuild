FROM ghcr.io/containerbase/base:10.15.4@sha256:42aa7bcc9eb13f4620225dd131fc4288dec0aef095bf7044816bfbc7b3c6f911

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
