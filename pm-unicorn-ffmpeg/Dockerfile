FROM lsiobase/ubuntu:amd64-xenial AS buildstage

RUN apt update && apt install git gpgv gnupg -y && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
	&& apt install -y nodejs \
    && /root-layer
	&& cd /opt \
	&& git clone https://github.com/UnicornTranscoder/UnicornFFMPEG \
	&& cd /opt/UnicornFFMPEG \
	&& git checkout master \
	&& npm install pkg \
	&& npm install --production \
	&& npm start \
	&& mv "/opt/UnicornFFMPEG/bin/Plex Transcoder-linux" "/root-laye/usr/lib/plexmediaserver/Plex Transcoder" \
	&& rm "/usr/lib/plexmediaserver/Plex Relay" \
	&& apt-get autoremove -y \
	&& rm -rf /var/lib/apt/lists/*

COPY pm-base-tools/root/ /root-layer/

FROM lsiobase/ubuntu:amd64-xenial

COPY --from=buildstage /root-layer/ /