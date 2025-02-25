FROM ghcr.io/containerbase/base:13.8.0@sha256:e574b2a87ac2ead295f2adc64b529dec684d211cb62bf0ddbc69a734e3212b8b

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.4

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
