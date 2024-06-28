FROM ghcr.io/containerbase/base:10.12.0@sha256:e23e8635f58ec2f8d9f8176ab065f6563920c263828c17d27aa00199612f6cb3

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
