FROM ghcr.io/containerbase/base:14.66.4@sha256:277771c67aa2a897241ff785a52c36b8f97227101e94e12682e2531c5de98e55

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
