# Use a lightweight Python image
FROM python:3.11-slim

# Avoid buffering stdout/stderr
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Install dependencies first for better layer caching
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application
COPY . .

# Flask app port
EXPOSE 5000

# Default command to run the app
CMD ["python", "app.py"]

