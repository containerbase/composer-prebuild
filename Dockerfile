FROM ghcr.io/containerbase/base:13.25.6@sha256:2423db7f08b72f552b9b03a155e8ff953ef7bbe9d767ca219cca859c46781746

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.0

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
