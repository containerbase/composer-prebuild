FROM ghcr.io/containerbase/base:13.13.8@sha256:954dc672875f4abe7f8f70bf0d35bc1f2e705eb3539969a27f51f7bbf75af64f

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
