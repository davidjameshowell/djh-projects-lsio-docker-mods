FROM alpine:3.10.2 AS buildstage

ARG RCLONE_VERSION=${RCLONE_VERSION:-1.55.0-beta.5347.20c5ca08f}
ARG RCLONE_BETA_URL=https://beta.rclone.org/v${RCLONE_VERSION}/rclone-v${RCLONE_VERSION}-linux-amd64.zip
ARG RCLONE_BETA_FILENAME=rclone-v${RCLONE_VERSION}-linux-amd64
ARG RCLONE_BETA_EXT=.zip
ARG CHAMBER_VERSION=${CHAMBER_VERSION:-2.9.1}

RUN apk --update add wget unzip && \
  mkdir -p /workdir/ && \
  mkdir -p /root-layer/usr/local/bin/ && \
  wget -O /workdir/$RCLONE_BETA_FILENAME$RCLONE_BETA_EXT "$RCLONE_BETA_URL" && \
  unzip /workdir/$RCLONE_BETA_FILENAME$RCLONE_BETA_EXT -d /workdir && \
  chmod a+x "/workdir/$RCLONE_BETA_FILENAME/rclone" && \
  wget -O /root-layer/usr/local/bin/chamber "https://github.com/segmentio/chamber/releases/download/v${CHAMBER_VERSION}/chamber-v${CHAMBER_VERSION}-linux-amd64" && \
  chmod +x /root-layer/usr/local/bin/chamber && \
  wget -O /tmp "https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-amd64.tgz" && \
  tar -xvf /tmp/cloudflared-stable-linux-amd64 && \
  mv /tmp/cloudflared-stable-linux-amd64 /root-layer/usr/local/bin/cloudflared && \
  chmod +x /root-layer/usr/local/bin/cloudflared && \
  mv /workdir/$RCLONE_BETA_FILENAME/rclone /root-layer/usr/local/bin/rclone

COPY pm-base-tools/root/ /root-layer/

FROM lsiobase/ubuntu:amd64-xenial

COPY --from=buildstage /root-layer/ /