FROM python:3.8-alpine

RUN adduser -D flask

WORKDIR /home/flask

COPY app app
COPY templates templates
COPY boot.sh boot.sh
COPY run.py run.py
COPY requirements.txt requirements.txt
RUN python -m venv venv
RUN venv/bin/python -m pip install --upgrade pip
RUN venv/bin/pip install -r requirements.txt


RUN chmod +x boot.sh

ENV FLASK_APP main.py

RUN chown -R flask:flask ./
USER flask

ENTRYPOINT ["./boot.sh"]