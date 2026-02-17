FROM ghcr.io/containerbase/base:14.3.0@sha256:67cee5cd4d7eceeccd42074c63cc32e0977dcfd7c1662fc5b1efd9dd83147615

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.3

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
