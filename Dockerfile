FROM ghcr.io/containerbase/base:13.8.69@sha256:0c95996454a315ba1c2375fad6240d894730841b167dcd5b5dffa853dfe6147a

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
