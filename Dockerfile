FROM ghcr.io/containerbase/base:14.6.11@sha256:38798b60223c1bb258672f5ff5c6b3bceea37567b56824d214fe1b1e5018367d

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.4

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
