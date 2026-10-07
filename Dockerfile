FROM ghcr.io/containerbase/base:14.29.0@sha256:ab6470e8abd42d4e19751edee0223085049f3b7f145e6c427fe70a0ddf1c43d1

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
