FROM ghcr.io/containerbase/base:14.47.0@sha256:6b2e8030d47d66a212c8481298c652e62a2af718c79822ab244eb0103ad5ded7

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
