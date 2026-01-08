FROM python:3.13-slim
WORKDIR /app

# Copy requirements from app folder (relative to build context)
COPY app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the app code
COPY app/ .

EXPOSE 5000
ENV APP_VERSION=v1

CMD ["python", "app.py"]
