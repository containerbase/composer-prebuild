FROM ghcr.io/containerbase/base:14.17.0@sha256:30cb0ab2dcad8cc85b0c5b2ff3ac23e7fba993020e08316f523ac1048b6d933a

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
