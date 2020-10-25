FROM php:7.4-fpm

RUN docker-php-ext-install pdo pdo_mysql

COPY crontab /etc/crontabs/root

RUN apt-get update
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget libappindicator3-1 libatk-bridge2.0-0 libgbm1
RUN npm install --global --unsafe-perm puppeteer
RUN chmod -R o+rx /usr/lib/node_modules/puppeteer/.local-chromium
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb
RUN apt-get install -f
RUN rm google-chrome-stable_current_amd64.deb

CMD ["crond", "-f"]
