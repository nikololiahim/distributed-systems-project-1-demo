from flask import render_template
from app import app


@app.route('/')
@app.route('/index')
def index():
    template = render_template("index.html")
    return template
