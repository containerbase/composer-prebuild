FROM ghcr.io/containerbase/base:14.67.2@sha256:98cb11c2825a3ebdc1fd75a12cb22d0cb2e7de4d64acb3cfac7c547bc7cc9f8f

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
