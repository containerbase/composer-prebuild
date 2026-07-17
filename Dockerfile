FROM ghcr.io/containerbase/base:14.13.2@sha256:690e3a966166453ad571d226336ccc479230bd7da963a6ea6318045822c8c193

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
