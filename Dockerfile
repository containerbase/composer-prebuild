FROM ghcr.io/containerbase/base:13.25.22@sha256:79df8a799b38482a59d6847aff950e78228a8e5b776fad4e363742e590984dfc

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.1

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
