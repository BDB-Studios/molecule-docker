FROM alpine

ARG APP_USER=molecule
ARG APP_GROUP=molecule

ENV PYTHONUNBUFFERED=1

RUN addgroup -S ${APP_GROUP}; \
     adduser -S ${APP_USER} -G ${APP_GROUP}; \
     apk add --no-cache python3; \
     if [ ! -e /usr/bin/python ]; then ln -sf python3 /usr/bin/python ; fi; \
     python3 -m ensurepip; \
     rm -r /usr/lib/python*/ensurepip; \
     pip3 install --no-cache --upgrade pip setuptools wheel; \
     if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi

USER ${APP_USER}

