FROM ghcr.io/containerbase/base:13.0.6@sha256:99610645f2526ac48f7dd1b7c02e7920a2a9581f6453639615a44812c3da15f1

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.13

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
