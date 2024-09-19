FROM ghcr.io/containerbase/base:11.11.18@sha256:1fee4f92a7a5d34bcd867904085da11f53354f05cb456004195523695dea182b

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
