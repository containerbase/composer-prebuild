FROM ghcr.io/containerbase/base:14.6.5@sha256:ede53d32c4dc8ade2f70d608ddeafe31df26983a5867fafd850d2a35767c8eef

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.4

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
