FROM ghcr.io/containerbase/base:13.0.19@sha256:fa8324235801784d83c19b3caafa5aabff9e2a74894123dc1b3617a97d9fe521

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.13

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
