FROM ghcr.io/containerbase/base:11.5.0@sha256:0009a535656ec8b5ac7715e272d70aab81f3c85479cb8948621709cede31dcc0

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
