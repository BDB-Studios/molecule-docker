FROM python:3.9.0a2-alpine3.10

ARG APP_USER=molecule
ARG APP_GROUP=molecule

ENV PYTHONUNBUFFERED=1

RUN addgroup -S ${APP_GROUP}; \
     adduser -S ${APP_USER} -G ${APP_GROUP}; \
     apk add --no-cache gcc g++; \
     ln -s /usr/include/locale.h /usr/include/xlocale.h; \
     if [ ! -e /usr/bin/python ]; then ln -sf python3 /usr/bin/python ; fi; \
     python3 -m ensurepip; \
     rm -r /usr/lib/python*/ensurepip; \
     pip3 install --no-cache --upgrade pip setuptools wheel virtualenv; \
     if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi; \
     rm -rf /var/cache/apk/*

USER ${APP_USER}

RUN mkdir -p ~/tests; \
    cd $_; \
    virtualenv .venv; \
    source .venv/bin/activate; \
    pip install -U molecule molecule[docker]
 
