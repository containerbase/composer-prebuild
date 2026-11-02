FROM ghcr.io/containerbase/base:14.60.0@sha256:270afb8aec22e3aa2837debb235a2d1b4d4adae63b8bd8a755e24bdc09b190c6

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
