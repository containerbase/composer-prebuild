FROM ghcr.io/containerbase/base:11.1.1@sha256:70c34b6cb30f90c15edb84dadda23f5245b005dc5e97dec774d5e2a2d2e2f454

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
