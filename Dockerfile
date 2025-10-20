FROM ghcr.io/containerbase/base:13.23.7@sha256:f66fbc64b8788361e6fc609eef5dc36c1fd183e60ee6d2391d49e07237b30a9c

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.13

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
