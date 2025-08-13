FROM ghcr.io/containerbase/base:13.8.65@sha256:948e09d87b2a0abace8af72f602134cf96c9ba6c22530e62d29f826e3eae30a7

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
