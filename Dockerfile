FROM ghcr.io/containerbase/base:14.57.2@sha256:f08107bd7aa05d53d26385c2dcc1c053487b01c040874a446dc9c8750afe4879

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
