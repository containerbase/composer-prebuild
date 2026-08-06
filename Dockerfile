FROM ghcr.io/containerbase/base:14.13.14@sha256:24d6b4d809993a73542c9187e858eaa1979ab252e77ea42d32286e592192ba39

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
