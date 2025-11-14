# Use an official Python runtime as a parent image
FROM python:3.9-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
CMD ["python", "app.py"]

#docker run -t <>/flask-app:latest
#docker build -t <>/flask-app:latest .
#docker login 

#docker push <>/flask-app:latest