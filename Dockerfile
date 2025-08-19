FROM ghcr.io/containerbase/base:13.10.5@sha256:bed98f2dcf0282cefdf3df27a438fadd44b218bb25fe31e09976fafb0ed1359d

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
