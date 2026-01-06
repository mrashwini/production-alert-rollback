# Use official Python image
FROM python:3.13-slim

# Set working directory
WORKDIR /app

# Copy requirements (we have only Flask)
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the app code
COPY . .

# Expose port
EXPOSE 5000

# Set default environment variable
ENV APP_VERSION=v1

# Command to run the app
CMD ["python", "app.py"]
