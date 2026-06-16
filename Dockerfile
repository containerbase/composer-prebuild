FROM ghcr.io/containerbase/base:14.11.4@sha256:53ad1cfcf61e6c6d51fcef4398a47276390086d79e90bc55a4f915c4cdf3f425

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
