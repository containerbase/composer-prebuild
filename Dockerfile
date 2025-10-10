FROM ghcr.io/containerbase/base:13.20.1@sha256:70597033e9654834055c94b76e705de7c9bd835cbab444138945c94dcbec2f4a

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.13

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
