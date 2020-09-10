from flask import render_template
from app import app
import socket


@app.route('/')
@app.route('/index')
def index():
    hostname = socket.gethostbyname(socket.gethostname())
    template = render_template("index.html", hostname=hostname)
    return template
