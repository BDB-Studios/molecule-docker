FROM alpine

ARG APP_USER=molecule
ARG APP_GROUP=molecule

RUN addgroup -S ${APP_GROUP}; \
     adduser -S ${APP_USER} -G ${APP_GROUP}
     
USER ${APP_USER}
