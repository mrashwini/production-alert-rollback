from flask import Flask, jsonify
import os

app = Flask(__name__)

VERSION = os.getenv("APP_VERSION", "v1")

@app.route("/")
def home():
    return jsonify({
        "status": "ok",
        "version": VERSION
    })

@app.route("/health")
def health():
    if VERSION == "v2":
        # simulate failure
        return jsonify({"status": "error"}), 500
    return jsonify({"status": "healthy"}), 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
