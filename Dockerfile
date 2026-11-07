FROM ghcr.io/containerbase/base:14.66.7@sha256:0e0075e19fe11a2706b15a23dfe06a318ed26503592fbe0820f11ea2cce70f38

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
