FROM ghcr.io/containerbase/base:13.0.5@sha256:7387ee77d85a0a2311a4b692e44a08f04edb3a115f644d7c8f36b770763d699d

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.13

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
