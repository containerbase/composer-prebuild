FROM ghcr.io/containerbase/base:14.67.0@sha256:647a13f9816980387af246d731c3d0ec9db4611929d0b7367850250f7f1b261d

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
