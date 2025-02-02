FROM ghcr.io/containerbase/base:13.7.3@sha256:8504006905fb6f051a8c0c8497b615b51758d49d4d73cfa7ee9ffa457db5a030

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.3

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
