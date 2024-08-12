FROM ghcr.io/containerbase/base:11.10.0@sha256:d4b08fa2c73dfc455bb73aaf4a69ef98d60dc65991cc738f5f1bce6c4189c57b

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
