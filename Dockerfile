FROM ghcr.io/containerbase/base:14.22.0@sha256:4471600a646738416f4491bf451bb6b356e0bdc87702ea99a4eada843cd3342b

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
