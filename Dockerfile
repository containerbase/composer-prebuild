FROM ghcr.io/containerbase/base:13.0.4@sha256:54eb74c1b3426fc3739b92b1da8f16c3294c97a973d654bc0b4822945d6d1b6a

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.13

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
