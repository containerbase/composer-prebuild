FROM ghcr.io/containerbase/base:13.8.14@sha256:ff57d05ee75a288878b9be45e9d27d478b2a14ed485ca96b359339e8bd9001c8

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
