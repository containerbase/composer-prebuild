FROM ghcr.io/containerbase/base:11.6.7@sha256:97e5df4bd894c29a69d91ffdd91c1770193b173f81bd28fb6fe967d13bf54a60

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
