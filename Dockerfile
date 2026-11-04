FROM ghcr.io/containerbase/base:14.66.0@sha256:0a32a3270baed78362c019694463bafcdae8cb84d8069901f832e274bdb29ddf

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
