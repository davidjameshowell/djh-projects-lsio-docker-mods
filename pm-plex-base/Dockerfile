FROM lsiobase/ubuntu:amd64-xenial

ARG PLEX_AUTOSCAN_BRANCH="master"
ARG PLEX_AUTOSCAN_COMMIT="4e31fb19d81ca9d7ff0fc2f362f9accfff979bc4"
RUN \
 apt-get update && \
 apt-get install -y \
    git \
    python3 \
    python3-pip \
    python3-dev \
    g++ \
    unzip && \
 git clone --depth 1 --single-branch --branch ${PLEX_AUTOSCAN_BRANCH} https://github.com/l3uddz/plex_autoscan.git /plex_autoscan && \
 cd /plex_autoscan && git checkout ${PLEX_AUTOSCAN_COMMIT} && cd - && \
 # Install/update pip and requirements
 pip3 install --no-cache-dir --upgrade pip setuptools wheel && \
 # PIP upgrade bug https://github.com/pypa/pip/issues/5221
 hash -r pip3 && \
 pip3 install --no-cache-dir --upgrade -r /plex_autoscan/requirements.txt && \
 # Remove dependencies
 apt-get purge -y --auto-remove \
   python3-dev \
   g++ && \
# Link python to python3
ln -s /usr/bin/python3 /usr/bin/python && \
 echo "**** cleanup ****" && \
 apt-get clean && \
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

HEALTHCHECK --interval=10s --timeout=8s CMD /healthcheck.sh || exit 1
ENV \
  # Plex_autoscan config file
  PLEX_AUTOSCAN_CONFIG=/autoscan/config.json \
  # Plex_autoscan queue db
  PLEX_AUTOSCAN_QUEUEFILE=/autoscan/queue.db \
  # Plex_autoscan log file
  PLEX_AUTOSCAN_LOGFILE=/autoscan/plex_autoscan.log \
  # Plex_autoscan cache db
  PLEX_AUTOSCAN_CACHEFILE=/autoscan/cache.db \
  # Plex_autoscan disable docker and sudo
  USE_DOCKER=false \
  USE_SUDO=false

COPY pm-plex-base/root/ /
