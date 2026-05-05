FROM ghcr.io/containerbase/base:14.9.6@sha256:fe182d00917eaea1c7ad7baabd603a6fd8ae22f5615dcfb3756ffde08dc2335d

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.5

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
