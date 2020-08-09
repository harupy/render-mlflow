FROM python:3.7

WORKDIR /app

RUN pip install mlflow

COPY create_dummy_data.py .
RUN python create_dummy_data.py

CMD ["mlflow", "ui", "--port=5000", "--host=0.0.0.0"]
