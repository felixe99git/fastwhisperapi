FROM python:3.10-slim

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    ffmpeg \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy project files
RUN git clone https://github.com/3choff/FastWhisperAPI.git .

# Install Python dependencies
RUN pip install --no-cache-dir fastapi uvicorn faster-whisper torch python-multipart

# Expose API port
EXPOSE 8000

# Start the FastAPI app with Uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
