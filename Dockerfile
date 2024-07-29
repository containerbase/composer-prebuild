FROM ghcr.io/containerbase/base:11.1.7@sha256:7661c62d53cb84b42cdd339050d6ccc3d5a46e79c78a07006be7e6fe70f0985a

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
