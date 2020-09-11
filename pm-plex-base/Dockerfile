FROM scratch

HEALTHCHECK --interval=10s --timeout=8s CMD /healthcheck.sh || exit 1

COPY pm-plex-base/root/ /
