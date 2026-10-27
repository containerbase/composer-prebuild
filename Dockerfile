FROM ghcr.io/containerbase/base:14.55.0@sha256:d873d3a7943fea99e5f7b4d434e0ea9780bbaad508836c22016f5e499d85dd50

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
