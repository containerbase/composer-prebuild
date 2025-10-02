FROM ghcr.io/containerbase/base:13.14.6@sha256:380bc83ea4cfe824ef1296f9400bb861e7065a1f89c9372ed7df743699d8ca1d

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.13

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
