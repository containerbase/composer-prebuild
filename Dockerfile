FROM ghcr.io/containerbase/base:13.8.60@sha256:187b78bb8fb861460a651ff36ab3abdb3a0cc8d0b3f491ca413c6886a47c9499

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
