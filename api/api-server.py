from flask import Flask
import subprocess

app = Flask(__name__)

@app.route("/report")
def report():
    data = subprocess.check_output(
        ["../bin/json-report.sh", "/var/log/nginx/access.log"]
    )
    return data

app.run(host="0.0.0.0", port=8080)