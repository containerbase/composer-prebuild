FROM ghcr.io/containerbase/base:13.3.0@sha256:1c41abb8eb0ae06d6b10303964bc6f00f4873da1afd5053d9b468128b76e478d

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.1

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
