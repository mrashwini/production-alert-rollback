FROM python:3.13-slim

WORKDIR /app

# Copy requirements file
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the app
COPY . .

EXPOSE 5000

CMD ["python", "server.py"]
