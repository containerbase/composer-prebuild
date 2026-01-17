FROM ghcr.io/containerbase/base:13.26.4@sha256:f5f4a7010d9ab7045d5717d04168db411c453e0504fce8084590206d1dc3eabc

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.2

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
