from python:3.11.4-bullseye

COPY . .
RUN pip install -r requirements.txt
EXPOSE 5000
CMD FLASK_APP=main.py flask run --host 0.0.0.0
