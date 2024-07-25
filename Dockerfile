FROM ghcr.io/containerbase/base:11.1.0@sha256:b8afd77f2618d55cd4bbd8a1e59849603f37668450736e7fa48008480ddc421b

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
