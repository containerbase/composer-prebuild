FROM ghcr.io/containerbase/base:14.6.8@sha256:cf0ea7ce7068b19d2bf9addab60181f4791d932379393f6a92cb3e0ea7953800

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.4

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
