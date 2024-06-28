ARG BUILD_FROM

FROM ${BUILD_FROM}

RUN apt-get update && \
    apt-get install -y --no-install-recommends android-tools-adb wget bash && \
    rm -rf /var/lib/apt/lists/*

# Download and install ttyd
RUN wget --quiet https://github.com/tsl0922/ttyd/releases/download/1.6.3/ttyd.x86_64 -O /usr/local/bin/ttyd && \
    chmod +x /usr/local/bin/ttyd

COPY run.sh /run.sh
COPY restricted-shell.sh /usr/local/bin/restricted-shell.sh
COPY adb_connect.sh /usr/local/bin/adb_connect.sh
RUN chmod +x /run.sh /usr/local/bin/restricted-shell.sh /usr/local/bin/adb_connect.sh

EXPOSE 5037 7681

CMD ["/run.sh"]
