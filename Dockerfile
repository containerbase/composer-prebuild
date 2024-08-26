FROM ghcr.io/containerbase/base:11.11.8@sha256:84abb66e5b105e1023dfd4b43a114c7d09ca68820c7db6a4e0a7e1e18ffbc426

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
