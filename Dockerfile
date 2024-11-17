FROM ghcr.io/containerbase/base:13.0.18@sha256:7c70fe961f582bbe0581067322d466191042317eaa26602a626c8a8d4980955b

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.13

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
