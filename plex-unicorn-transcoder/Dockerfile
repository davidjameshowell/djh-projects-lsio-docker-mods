FROM phusion/baseimage:latest

RUN apt update && apt install git gpgv gnupg -y && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
	&& apt install -y nodejs \
	&& cd /opt \
	&& git clone https://github.com/UnicornTranscoder/UnicornFFMPEG \
	&& cd /opt/UnicornFFMPEG \
	&& git checkout master \
	&& npm install pkg \
	&& npm install --production \
	&& npm start \
    && git clone https://github.com/UnicornTranscoder/UnicornLoadBalancer.git \
    && cd UnicornLoadBalancer \
    && npm install \
	&& apt-get autoremove -y \
	&& rm -rf /var/lib/apt/lists/*
    
FROM scratch

# copy local files
COPY plex-unicorn-transcoder/root/ /
