# https://github.com/CM2Walki/steamcmd/blob/master/bullseye/Dockerfile
FROM cm2network/steamcmd:root

LABEL maintainer="juuso.takala86@gmail.com"

# Appid for Wreckfest
ENV STEAMAPPID 361580
ENV STEAMAPP wreckfest
ENV SERVER_NAME "defaultservername"
ENV SERVER_PASSWORD "defaultserverpassword"
ENV STEAMAPPDIR "${HOMEDIR}/${STEAMAPP}-dedicated"
ENV DLURL https://raw.githubusercontent.com/divn/wreckfestdocker

RUN set -x \
    # Install, update & upgrade packages
    && apt-get update \
    && apt-get install -y --no-install-recommends --no-install-suggests \
    software-properties-common \
    wine \
    winbind \
    xvfb \
    xauth \
    wget \
    && mkdir -p "${STEAMAPPDIR}" \
    # Add entry script
    && wget --max-redirect=30 "${DLURL}/master/etc/entry.sh" -O "${HOMEDIR}/entry.sh" \
    && chmod +x "${HOMEDIR}/entry.sh" \
    && chown -R "${USER}:${USER}" "${HOMEDIR}/entry.sh" "${STEAMAPPDIR}" \
    # Clean up
    && rm -rf /var/lib/apt/lists/*

# Switch to user
USER ${USER}

WORKDIR ${HOMEDIR}

CMD ["bash", "entry.sh"] 

# Expose ports
EXPOSE 33540/udp \
    27015/tcp \
    27015/udp \
    27016/udp



