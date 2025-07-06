FROM ghcr.io/containerbase/base:13.8.52@sha256:a77ff546359430da174457c545a4e29e04408fe88bb4500be85797ef11767559

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
