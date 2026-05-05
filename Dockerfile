FROM ghcr.io/containerbase/base:14.10.0@sha256:9fa84f192de2245fa4e7afaf0188dd4a63b7ec8c02d10604afbf2216c43f0e63

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.5

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
