FROM ghcr.io/containerbase/base:14.7.4@sha256:57468abc14e44f041fe64a5229f8d7d424906d79cd2922c0fdf448914265640d

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.5

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
