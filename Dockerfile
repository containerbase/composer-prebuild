FROM ghcr.io/containerbase/base:11.11.9@sha256:a7101cc6aefc500f72d990ace17539c6f3ce17dd236d762992bfcd5b246d1f3d

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
