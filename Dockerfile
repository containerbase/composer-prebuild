FROM ghcr.io/containerbase/base:13.26.5@sha256:e79da12a49299dfa704ad77cad29e9cb41457105ea3a1e721128c5a0dae28cfd

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.2

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
