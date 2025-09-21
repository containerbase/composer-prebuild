FROM ghcr.io/containerbase/base:13.13.12@sha256:e746df1a32cfcda57f689ac4793dfbca5bec27d17e5562f3c77d5eba5bd098f6

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
