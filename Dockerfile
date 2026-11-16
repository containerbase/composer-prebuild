FROM ghcr.io/containerbase/base:14.66.26@sha256:1e24ab869d0125592ed086e5a610f2be80f8a59262240d0498b08e6efc93117f

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
