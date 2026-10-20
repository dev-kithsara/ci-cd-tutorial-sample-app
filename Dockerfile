FROM python:3.8-slim

WORKDIR /sample-app

ENV FLASK_APP=bootstrap.py
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["sh", "-c", "flask db upgrade && python seed.py && gunicorn -b 0.0.0.0:8000 bootstrap:app"]