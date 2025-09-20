FROM ghcr.io/containerbase/base:13.13.9@sha256:abf41bd07f1aecd460395506c26f1c39623ca60fa61f83a3b6684b91a691fea9

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
