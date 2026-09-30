FROM ghcr.io/containerbase/base:14.20.3@sha256:3380da53817544e45f70078298a0b35e9da20088de170f358aee75154415aea6

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
