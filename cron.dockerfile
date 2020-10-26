FROM php:7.4-cli-alpine

RUN docker-php-ext-install pdo pdo_mysql

ENV SUPERCRONIC_URL=https://github.com/aptible/supercronic/releases/download/v0.1.9/supercronic-linux-amd64 \
    SUPERCRONIC=supercronic-linux-amd64 \
    SUPERCRONIC_SHA1SUM=5ddf8ea26b56d4a7ff6faecdd8966610d5cb9d85

RUN curl -fsSLO "$SUPERCRONIC_URL" \
 && echo "${SUPERCRONIC_SHA1SUM}  ${SUPERCRONIC}" | sha1sum -c - \
 && chmod +x "$SUPERCRONIC" \
 && mv "$SUPERCRONIC" "/usr/local/bin/${SUPERCRONIC}" \
 && ln -s "/usr/local/bin/${SUPERCRONIC}" /usr/local/bin/supercronic

RUN addgroup -g 1337 innergroup
RUN adduser --disabled-password innerme
RUN addgroup innerme innergroup

ADD crontab /etc/crontab

USER innerme

CMD [ "/usr/local/bin/supercronic", "/etc/crontab" ]
