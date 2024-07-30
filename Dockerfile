FROM ghcr.io/containerbase/base:11.4.0@sha256:6d17e17388fbf6f93c887ca87fb48680570309f87f670fee2eba6bf047df2389

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
