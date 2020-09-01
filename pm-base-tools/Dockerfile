FROM alpine:3.10.2 AS utilities

ARG RCLONE_VERSION=${RCLONE_VERSION:-1.52.3}
ARG RCLONE_BETA_URL=https://downloads.rclone.org/v${RCLONE_VERSION}/rclone-v${RCLONE_VERSION}-linux-amd64.zip
ARG RCLONE_BETA_FILENAME=rclone-v${RCLONE_VERSION}-linux-amd64
ARG RCLONE_BETA_EXT=.zip
ARG CHAMBER_VERSION=${CHAMBER_VERSION:-2.8.2}
ARG MINIO_CLIENT_URL=https://dl.min.io/client/mc/release/linux-amd64/mc

RUN apk --update add wget unzip && \
  mkdir -p /workdir && \
  wget -O /workdir/mc "$MINIO_CLIENT_URL" && \
	chmod a+x /workdir/mc && \	
  wget -O /workdir/$RCLONE_BETA_FILENAME$RCLONE_BETA_EXT "$RCLONE_BETA_URL" && \
  unzip /workdir/$RCLONE_BETA_FILENAME$RCLONE_BETA_EXT -d /workdir && \
  chmod a+x "/workdir/$RCLONE_BETA_FILENAME/rclone" && \
  cp /workdir/$RCLONE_BETA_FILENAME/rclone /workdir && \
  wget -O /workdir/chamber "https://github.com/segmentio/chamber/releases/download/v${CHAMBER_VERSION}/chamber-v${CHAMBER_VERSION}-linux-amd64" && \
  chmod +x /workdir/chamber

# Begin scratch

FROM lsiobase/ubuntu:amd64-xenial

COPY --from=utilities /workdir/rclone /usr/local/bin/rclone
COPY --from=utilities /workdir/chamber /bin/chamber
COPY --from=utilities /workdir/mc /bin/mc


RUN \
 apt-get update && \
 apt-get install -y \
	fuse wget vim unzip && \
 echo "**** cleanup ****" && \
 apt-get clean && \
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

COPY pm-base-tools/root/ /
