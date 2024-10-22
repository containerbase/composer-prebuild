FROM ghcr.io/containerbase/base:13.0.0@sha256:aafc73427c3869d1cd0e927c80e9549afd75113c129a2c8ef6e4dd70047f9f1a

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
