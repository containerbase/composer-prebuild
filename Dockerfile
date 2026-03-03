FROM ghcr.io/containerbase/base:14.4.12@sha256:002f0431c03e26054956313950f83fc28a76915820f4fbc5c92205c765ac23d7

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.3

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
