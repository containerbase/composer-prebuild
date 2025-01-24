FROM ghcr.io/containerbase/base:13.7.1@sha256:30723babfc2fa1699d87f6ee26b145b8974c59aaf902f274822f8a2268756269

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.3

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
