FROM ghcr.io/containerbase/base:14.10.7@sha256:54587899256900502163b089fe86ad9f959f4b8ba02e38338c684712832ae6d2

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
