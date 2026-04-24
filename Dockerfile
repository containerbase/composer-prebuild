FROM ghcr.io/containerbase/base:14.9.0@sha256:c353a9e1a66bbb93036fa063bac7816ef905911425f082939630e8cb4ee9f643

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.5

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
