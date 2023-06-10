from flask import Flask, request, json
import os
import pickle

app = Flask(__name__)

file_path = "model.pickle"
model = pickle.load(open(file_path, "rb"))


@app.route("/predict", methods=["POST"])
def predict():
    data = json.loads(request.data)
    coordinate = data.get("coordinate")
    prediction = model.predict(coordinate)
    # [{"lat": 1.0, "lng": 2.0}]
    # curl -d '{"coordinate": []}' -H "Content-Type: application/json" -X POST localhost:5000/predict
    return json.dumps(prediction)


if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    app.run(debug=True, host="0.0.0.0", port=port)
