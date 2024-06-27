FROM ghcr.io/containerbase/base:10.11.7@sha256:5055918e83c5fa5b9588c69280bbd9600b7769768218258e913c09da8961eaa3

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
