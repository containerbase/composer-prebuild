FROM ghcr.io/containerbase/base:13.5.2@sha256:6457c31a4f2770b0fa9651f743ca7c3e988b263b45a8550a7182ca0b1ad21c52

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.2

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
