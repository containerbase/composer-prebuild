FROM ghcr.io/containerbase/base:14.4.10@sha256:76ddcd8525a82ac97a9218f5432b38a195111002923d7bf46ede7319718567d1

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.3

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
