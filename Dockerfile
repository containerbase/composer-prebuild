FROM ghcr.io/containerbase/base:12.0.8@sha256:4c972bdc114bd049c41ac7ecbf5f50d19d4a202f7837bf2f0b5b6a3bae7ff407

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
