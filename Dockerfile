FROM ghcr.io/containerbase/base:14.65.0@sha256:6ca0cd0aac60fdf6d1499b9904187859adce1d304b79a72418375adc0408ae95

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
