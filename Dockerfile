# SPDX-FileCopyrightText: 2025 Joe Pitt
#
# SPDX-License-Identifier: GPL-3.0-only

FROM docker.io/library/nextcloud:latest
LABEL org.opencontainers.image.authors="joepitt91 via https://github.com/joepitt91/nextcloud-aio/issues"
LABEL org.opencontainers.image.base.name=docker.io/library/nextcloud:latest
LABEL org.opencontainers.image.description="Nextcloud is an open-source self-hosted platform for file hosting, syncing, and collaboration."
LABEL org.opencontainers.image.documentation=https://github.com/joepitt91/nextcloud-aio
LABEL org.opencontainers.image.licenses=GPL-3.0-only
LABEL org.opencontainers.image.source=https://github.com/joepitt91/nextcloud-aio
LABEL org.opencontainers.image.title="Nextcloud"
LABEL org.opencontainers.image.url=https://github.com/joepitt91/nextcloud-aio
LABEL org.opencontainers.image.version=latest
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get -y -qq update && \
    apt-get -y -qq install ffmpeg libreoffice nodejs npm && \
    apt-get -y -qq clean
HEALTHCHECK CMD [ "CMD", "/bin/sh", "-c", "curl -f http://localhost/index.php || exit 1" ]
