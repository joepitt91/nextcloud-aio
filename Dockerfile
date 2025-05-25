# SPDX-FileCopyrightText: 2025 Joe Pitt
#
# SPDX-License-Identifier: GPL-3.0-only
ARG NEXTCLOUD_VERSION=latest
FROM docker.io/library/nextcloud:${NEXTCLOUD_VERSION}
LABEL org.opencontainers.image.authors="joepitt91 via https://github.com/joepitt91/nextcloud-aio/issues"
LABEL org.opencontainers.image.base.name=docker.io/library/nextcloud:${NEXTCLOUD_VERSION}
LABEL org.opencontainers.image.description="A safe home for all your data. Access & share your files, calendars, contacts, mail & more from any device, on your terms."
LABEL org.opencontainers.image.documentation=https://github.com/joepitt91/nextcloud-aio
LABEL org.opencontainers.image.licenses=GPL-3.0-only
LABEL org.opencontainers.image.source=https://github.com/joepitt91/nextcloud-aio
LABEL org.opencontainers.image.title="Nextcloud"
LABEL org.opencontainers.image.url=https://github.com/joepitt91/nextcloud-aio
LABEL org.opencontainers.image.version=${NEXTCLOUD_VERSION}
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get -yq update && \
    apt-get -yq install ffmpeg libreoffice nodejs npm && \
    apt-get -yq clean
HEALTHCHECK CMD [ "CMD", "/bin/sh", "-c", "curl -f http://localhost/index.php || exit 1" ]
