FROM python:3.8-slim

WORKDIR /sample-app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["sh", "-c", "flask db upgrade && python seed.py && gunicorn -b 0.0.0.0:8000 app:app"]