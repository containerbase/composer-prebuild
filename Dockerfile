FROM ghcr.io/containerbase/base:14.5.4@sha256:561a75770ded8e89bd44cbf9bc07aa00c17fe020caf7ee41e24ca4f4fca98950

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.4

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
