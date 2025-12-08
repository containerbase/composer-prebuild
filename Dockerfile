FROM ghcr.io/containerbase/base:13.25.10@sha256:a9c0fae09ce598aedf3a8105269ec74dad276e842ac1dba6b62e4ac4d7cb9e3f

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.0

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
