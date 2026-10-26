FROM ghcr.io/containerbase/base:14.52.7@sha256:ec439441226e331b8cc67f666a7730dd9aa574bab41d6036913097291efc4255

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
