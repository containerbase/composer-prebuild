FROM ghcr.io/containerbase/base:14.5.0@sha256:a6b8380f8c17cf3b2cdadfc4c417fa4b368ab24223ae3e2f79e4f7110ce41575

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.3

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
