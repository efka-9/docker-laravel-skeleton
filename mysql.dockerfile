FROM mysql:5.7.29

RUN addgroup --gid 1337 innergroup
RUN adduser --disabled-password --gecos "" --force-badname --gid 1337 innerme

USER innerme
