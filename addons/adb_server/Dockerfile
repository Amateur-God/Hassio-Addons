# Use the appropriate base image depending on the target architecture
ARG BUILD_FROM
FROM ${BUILD_FROM}

# Install necessary packages and wget for downloading tini
RUN apt-get update && \
    apt-get install -y --no-install-recommends android-sdk-platform-tools wget bash build-essential cmake git libjson-c-dev libwebsockets-dev dos2unix && \
    rm -rf /var/lib/apt/lists/* && \
    git clone https://github.com/tsl0922/ttyd.git

WORKDIR /ttyd
RUN mkdir build
WORKDIR /ttyd/build
RUN cmake .. && \
    make && make install

# Download and install tini based on the target architecture
ARG TARGETARCH
RUN case "$TARGETARCH" in \
    "amd64") TINI_URL="https://github.com/krallin/tini/releases/download/v0.19.0/tini";; \
    "arm64") TINI_URL="https://github.com/krallin/tini/releases/download/v0.19.0/tini-arm64";; \
    "arm") TINI_URL="https://github.com/krallin/tini/releases/download/v0.19.0/tini-armhf";; \
    "386") TINI_URL="https://github.com/krallin/tini/releases/download/v0.19.0/tini-i386";; \
    *) echo "Unsupported architecture: $TARGETARCH" && exit 1;; \
    esac && \
    wget -q -O /usr/bin/tini $TINI_URL && \
    chmod +x /usr/bin/tini

COPY run.sh /run.sh
COPY restricted-shell.sh /usr/local/bin/restricted-shell.sh
COPY adb_connect.sh /usr/local/bin/adb_connect.sh
RUN dos2unix /run.sh /usr/local/bin/restricted-shell.sh /usr/local/bin/adb_connect.sh
RUN chmod +x /run.sh /usr/local/bin/restricted-shell.sh /usr/local/bin/adb_connect.sh

EXPOSE 5037 7681

ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_DESCRIPTION
ARG BUILD_NAME
ARG BUILD_REF
ARG BUILD_REPOSITORY
ARG BUILD_VERSION

LABEL \
    io.hass.name="${BUILD_NAME}" \
    io.hass.description="${BUILD_DESCRIPTION}" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Amateur-God" \
    org.opencontainers.image.title="${BUILD_NAME}" \
    org.opencontainers.image.description="${BUILD_DESCRIPTION}" \
    org.opencontainers.image.vendor="AG Hassio Addons & Integrations" \
    org.opencontainers.image.authors="Amateur-God" \
    org.opencontainers.image.licenses="GPLV3" \
    org.opencontainers.image.url="" \
    org.opencontainers.image.source="https://github.com/${BUILD_REPOSITORY}" \
    org.opencontainers.image.documentation="https://github.com/${BUILD_REPOSITORY}/blob/main/README.md" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.revision=${BUILD_REF} \
    org.opencontainers.image.version=${BUILD_VERSION}

# Use tini as the init system
ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["/run.sh"]
