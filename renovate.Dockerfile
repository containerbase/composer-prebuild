#-------------------------
# renovate rebuild trigger
#-------------------------

# makes lint happy
FROM scratch

# renovate: datasource=github-releases packageName=composer/composer
RUN install-tool composer 2.8.11
