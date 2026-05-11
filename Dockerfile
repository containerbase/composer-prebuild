FROM ghcr.io/containerbase/base:14.10.9@sha256:84055e6df0bddc285b73576e2f68cd7dd30f89f2a1eff6404d53ecccd476866f

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
