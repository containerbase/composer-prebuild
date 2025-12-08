FROM ghcr.io/containerbase/base:13.25.11@sha256:9b93a1a8774314e59e286a59fe332577b784b587c66cb68ab12e9101a7e98155

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.0

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
