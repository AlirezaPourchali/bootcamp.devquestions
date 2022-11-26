FROM registry.gitlab.com/qio/standard/node:17.3-alpine3.14

WORKDIR /api

COPY . .
RUN npm i

RUN chmod +x /api/runner.sh
ENTRYPOINT /api/runner.sh
