from flask import Flask, request, json
import os
import json

app = Flask(__name__)

file_path = "myfile.json"


@app.route("/predict", methods=["POST"])
def predict():
    with open(file_path, "w") as f:
	    return json.load(f)


if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    app.run(debug=True, host="0.0.0.0", port=port)
