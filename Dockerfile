FROM ghcr.io/containerbase/base:11.7.0@sha256:8139b7bc532b4386db6ce301fdcbc74f5a7994a479d1941f1bfd3744c98351ee

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
