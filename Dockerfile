FROM ghcr.io/containerbase/base:13.7.13@sha256:7b40f4ace6bc97653a2063a6363449090aa47c50a669201c14370cf77dceac9c

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.4

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
