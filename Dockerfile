FROM ghcr.io/containerbase/base:14.57.0@sha256:776c077dd0534c22637fd7d8426533e56e8b616d9b4c555f1ca96bc6a08f853a

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
