from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/")
def home():
    return jsonify({"message": "Hello This is Naseem shaik from Oman!"})

@app.route("/health")
def health():
    return jsonify({"status": "ok"}), 200

@app.route("/fail")
def fail():
    return jsonify({"status": "error"}), 500

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
