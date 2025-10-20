FROM ghcr.io/containerbase/base:13.23.6@sha256:af7c74e000727bfc7641235ddfaabd606270e7e97cd68de95dd1422b8fc8cf00

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.13

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
