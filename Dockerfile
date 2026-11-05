FROM ghcr.io/containerbase/base:14.66.1@sha256:556f8a473cefba14b7942a140a1900beb3bc178dd36e0e129961c18933e7ae11

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
