FROM ghcr.io/containerbase/base:13.5.7@sha256:627978b5b635e45a463641dd0279650106cb36c70a83eaeba1839088a1e938b6

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.2

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
