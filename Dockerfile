FROM ghcr.io/containerbase/base:14.6.13@sha256:a73dd9860a4a872d9487936af5ef14ccefce28793d10cb21a868106ead6cd06a

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.4

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
