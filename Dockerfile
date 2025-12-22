FROM ghcr.io/containerbase/base:13.25.17@sha256:8539dc9e33f49dc3c1f6ac4ccdd73de69cb92fde5f90e204c6256447a5a0b61f

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.1

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
