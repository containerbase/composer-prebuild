FROM ghcr.io/containerbase/base:14.66.24@sha256:9d6ab87e0a25f7925ff8e5c262043a1907f2847f9c561372b9d9a9eca6bad843

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
