FROM ghcr.io/containerbase/base:13.7.5@sha256:cf716be71cfd908afb59074739938f55857ff9d756665533be3ae61fb29306df

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.3

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
