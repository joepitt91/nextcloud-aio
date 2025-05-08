# SPDX-FileCopyrightText: 2025 Joe Pitt
#
# SPDX-License-Identifier: GPL-3.0-only

FROM nextcloud:latest
LABEL org.opencontainers.image.authors=joepitt91
LABEL org.opencontainers.image.base.name=docker.io/_/nextcloud:latest
LABEL org.opencontainers.image.description="Remote collaboration made easy."
LABEL org.opencontainers.image.documentation=https://github.com/joepitt91/nextcloud-aio
LABEL org.opencontainers.image.source=https://github.com/joepitt91/nextcloud-aio
LABEL org.opencontainers.image.title="Nextcloud"
LABEL org.opencontainers.image.url=https://github.com/joepitt91/nextcloud-aio
RUN apt-get -yq update && \
    apt-get -yq install ffmpeg libreoffice nodejs npm && \
    apt-get -yq clean
HEALTHCHECK CMD [ "CMD", "/bin/sh", "-c", "curl -f http://localhost/index.php || exit 1" ]
