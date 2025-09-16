FROM ghcr.io/containerbase/base:13.13.3@sha256:925fa6770b93ac5d18306f086e6b08fd1e8e351c1384518c83ce087afec85ffa

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
