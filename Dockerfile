FROM alpine:edge
RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN adduser -D app

WORKDIR /home/app

RUN apk update
RUN apk upgrade
RUN apk add py3-pip py3-gunicorn

COPY requirements.txt requirements.txt
RUN python -m venv venv
RUN venv/bin/pip install -r requirements.txt
COPY app.py app.py
COPY boot.sh boot.sh

RUN chmod 700 /home/app/boot.sh
RUN chown -R app:app /home/app

USER app
EXPOSE 5000

ENTRYPOINT ["/home/app/boot.sh"]
