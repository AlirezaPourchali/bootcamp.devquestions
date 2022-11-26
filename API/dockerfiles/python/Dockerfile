FROM registry.gitlab.com/qio/standard/python:3.10-alpine

WORKDIR /api

COPY . .
RUN pip install -r requirements.txt

RUN chmod +x /api/runner.sh
ENTRYPOINT /api/runner.sh
