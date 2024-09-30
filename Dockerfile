FROM ghcr.io/containerbase/base:11.11.27@sha256:14d8b62ccd92c1e0e6ffd2cb58d825d6c64d33323c5fc0732dc67d21968fd34b

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
