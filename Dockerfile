FROM ghcr.io/containerbase/base:13.26.2@sha256:c756d0acc372c1ab80fda67bfd5ef53fa27516018bab44a9a06d17addee94fea

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.1

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
