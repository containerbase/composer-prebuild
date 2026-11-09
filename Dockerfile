FROM ghcr.io/containerbase/base:14.66.12@sha256:3e155635e9a800dd8d5d091f8b0bc237217b1e721359dd88c2b6805ba123ef24

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
