FROM ghcr.io/containerbase/base:13.5.8@sha256:61f6a70c919f3be9e22f78039d046cd3443b7a5e09078b7fa0683db3791d8a31

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.2

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
