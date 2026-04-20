FROM ghcr.io/containerbase/base:14.7.1@sha256:0dcb1902480f2281939521bb9be873801f9482b4a41aab430391869f1bbc3059

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.5

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
