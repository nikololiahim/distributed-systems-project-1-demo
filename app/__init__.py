from flask import Flask

app = Flask(__name__, template_folder="../templates")
app.config["CACHE_TYPE"] = "null"

from app import routes