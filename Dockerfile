FROM ghcr.io/containerbase/base:13.8.63@sha256:5830c2a0ab7c9012011bb3fc4e66c04233a8f5fe9b06312489c90e3e4764748a

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
