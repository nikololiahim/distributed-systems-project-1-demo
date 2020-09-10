FROM python:3.8-alpine

RUN adduser -D flask

WORKDIR /home/flask

COPY . .
RUN rm -rf venv && \
    rm -rf .idea && \
    rm -rf __pycache__ && \
    python3 -m venv venv && \
    venv/bin/python -m pip install --upgrade pip && \
    venv/bin/pip install -r requirements.txt && \
    chmod +x boot.sh && \
    chown -R flask:flask ./

ENV FLASK_APP main.py

USER flask

ENTRYPOINT ["./boot.sh"]