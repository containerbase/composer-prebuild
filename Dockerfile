FROM ghcr.io/containerbase/base:13.0.25@sha256:703d5833b6625642ecd2122a702b427e2bcb187d63bc83bc482fa0b3f80e6f81

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.1

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
