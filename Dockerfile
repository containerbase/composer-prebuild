FROM ghcr.io/containerbase/base:14.4.6@sha256:ac62885e476860e8c6c73217d7483a13740188fc5fdc7e684b57e29b0afc8580

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.3

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
