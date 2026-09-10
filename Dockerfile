FROM ghcr.io/containerbase/base:14.14.5@sha256:72ef57cb224c7868e22a6b068d71b1ec538926fe1fcfc6a561d9821d14cc81ff

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
