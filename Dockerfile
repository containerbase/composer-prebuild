FROM ghcr.io/containerbase/base:13.23.2@sha256:2a0470066e3082770b8cc3e0307271560aabb25ce2f426be341c37c1fe525349

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.13

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
