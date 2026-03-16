FROM ghcr.io/containerbase/base:14.6.3@sha256:2a059ec3a136722ae17364483a108c3ceb201ce13c06777b948b0fea4ca65045

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.4

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
