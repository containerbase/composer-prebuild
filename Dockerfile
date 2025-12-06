FROM ghcr.io/containerbase/base:13.25.9@sha256:cb6a8d374845f1c8b8fb3952d1c280575ab6b382bc4b5c1cf00b35fd4dbfbc54

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.0

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
