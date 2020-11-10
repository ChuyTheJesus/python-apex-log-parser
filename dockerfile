FROM python:3.7.7-slim-buster
COPY . /app
WORKDIR /app

CMD "python3" "main.py" "LogFile.log" "results.json"