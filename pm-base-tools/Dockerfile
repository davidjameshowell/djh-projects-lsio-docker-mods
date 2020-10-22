FROM alpine:3.10.2 AS buildstage

ARG RCLONE_VERSION=${RCLONE_VERSION:-1.54.0-beta.4831.4e2b5389d}
ARG RCLONE_BETA_URL=https://beta.rclone.org/v${RCLONE_VERSION}/rclone-v${RCLONE_VERSION}-linux-amd64.zip
ARG RCLONE_BETA_FILENAME=rclone-v${RCLONE_VERSION}-linux-amd64
ARG RCLONE_BETA_EXT=.zip
ARG CHAMBER_VERSION=${CHAMBER_VERSION:-2.9.0}

RUN apk --update add wget unzip && \
  mkdir -p /rclonedir/ && \
  mkdir -p /chamberdir/usr/local/bin/ && \
  mkdir -p /root-layer/ && \
  wget -O /rclonedir/$RCLONE_BETA_FILENAME$RCLONE_BETA_EXT "$RCLONE_BETA_URL" && \
  unzip /rclonedir/$RCLONE_BETA_FILENAME$RCLONE_BETA_EXT -d /workdir && \
  chmod a+x "/rclonedir/$RCLONE_BETA_FILENAME/rclone" && \
  wget -O /chamberdir/usr/local/bin/chamber "https://github.com/segmentio/chamber/releases/download/v${CHAMBER_VERSION}/chamber-v${CHAMBER_VERSION}-linux-amd64" && \
  chmod +x /chamberdir/usr/local/bin/chamber && \
  mv /rclonedir/$RCLONE_BETA_FILENAME/rclone /root-layer/usr/local/bin/rclone && \
  mv /rclonedir/usr/local/bin/chamber /root-layer/usr/local/bin/chamber

COPY pm-base-tools/root/ /root-layer/

FROM lsiobase/ubuntu:amd64-xenial

COPY --from=buildstage /root-layer/ /