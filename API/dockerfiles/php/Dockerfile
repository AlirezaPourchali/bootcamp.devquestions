FROM registry.gitlab.com/qio/standard/composer:2.2

WORKDIR /api

COPY . .
RUN composer install

RUN chmod +x /api/runner.sh
ENTRYPOINT /api/runner.sh
