FROM ghcr.io/containerbase/base:13.13.4@sha256:ff4900ce492d2ff933ed26948744aeac575c8441dcaba035cd57ec6626b5d036

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
