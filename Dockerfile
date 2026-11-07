FROM ghcr.io/containerbase/base:14.66.6@sha256:54ca0bd3a74ddcd92b838512401ffed05a07f34b0b95d925041a20bf9d50253f

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
