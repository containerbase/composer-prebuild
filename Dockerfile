FROM ghcr.io/containerbase/base:14.6.20@sha256:d81e298a1d585c636ac609cbba6182537915b02545f60482f431d22e16609355

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.5

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
