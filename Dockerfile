FROM ghcr.io/containerbase/base:14.52.6@sha256:bbc6d790fec3f79f338d7dc63053167c01154129bcfa6e9419ab0684ff25465a

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
