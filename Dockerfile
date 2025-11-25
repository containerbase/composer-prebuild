FROM ghcr.io/containerbase/base:13.25.3@sha256:936e07abbc9b4c6e28c010f70aa63b25b41c214c7f185d4deb1bb1e2cfce390d

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.0

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
