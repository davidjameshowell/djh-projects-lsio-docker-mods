FROM alpine:3.13.6 AS buildstage

ARG RCLONE_VERSION=${RCLONE_VERSION:-v1.56.2}
#ARG RCLONE_BETA_URL=https://beta.rclone.org/v${RCLONE_VERSION}/rclone-v${RCLONE_VERSION}-linux-amd64.zip
ARG RCLONE_URL=https://downloads.rclone.org/${RCLONE_VERSION}/rclone-${RCLONE_VERSION}-linux-amd64.zip
ARG RCLONE_FILENAME=rclone-${RCLONE_VERSION}-linux-amd64
ARG RCLONE_EXT=.zip
ARG CHAMBER_VERSION=${CHAMBER_VERSION:-2.10.7}
ARG CLOUDFLARED_VERSION=${CLOUDFLARED_VERSION:-2021.10.3}

RUN apk --update add wget unzip && \
  mkdir -p /workdir/ && \
  mkdir -p /root-layer/usr/local/bin/ && \
  wget -O /workdir/$RCLONE_FILENAME$RCLONE_EXT "$RCLONE_URL" && \
  unzip /workdir/$RCLONE_FILENAME$RCLONE_EXT -d /workdir && \
  chmod a+x "/workdir/$RCLONE_FILENAME/rclone" && \
  wget -O /root-layer/usr/local/bin/chamber "https://github.com/segmentio/chamber/releases/download/v${CHAMBER_VERSION}/chamber-v${CHAMBER_VERSION}-linux-amd64" && \
  chmod +x /root-layer/usr/local/bin/chamber && \
  wget -O /root-layer/usr/local/bin/cloudflared "https://github.com/cloudflare/cloudflared/releases/download/${CLOUDFLARED_VERSION}/cloudflared-linux-amd64" && \
  chmod +x /root-layer/usr/local/bin/cloudflared && \
  mv /workdir/$RCLONE_FILENAME/rclone /root-layer/usr/local/bin/rclone

COPY pm-base-tools/root/ /root-layer/

FROM scratch

COPY --from=buildstage /root-layer/ /