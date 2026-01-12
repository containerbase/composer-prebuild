FROM ghcr.io/containerbase/base:13.25.24@sha256:1943eff8ba2978f7d12d259c89d3c404027a4de407817c9a100e4f6c19ba74ff

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.1

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
