FROM ghcr.io/containerbase/base:14.6.16@sha256:93f2ac4559d66d5e0a0c7a8168b597d71fa83e616d903b3cd66fb437ef5ec6e8

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.4

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
