FROM ghcr.io/containerbase/base:14.59.2@sha256:bb019b8f49a5eab09254e41bf0d982a3690e98aeda9593287f407a4352b072a0

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
