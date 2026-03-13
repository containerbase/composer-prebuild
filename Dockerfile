FROM ghcr.io/containerbase/base:14.6.0@sha256:815ab35943a851c4d6b5f7447189da2fe89871a99299afc837c52e93172ce92a

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.4

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
