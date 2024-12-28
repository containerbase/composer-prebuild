FROM ghcr.io/containerbase/base:13.5.5@sha256:b65aebe9e5536561185841e030f822fd7ba4266ef8fcc5680b00f0d48cb441f9

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.2

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
