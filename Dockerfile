FROM python:3.7

WORKDIR /app

RUN pip install mlflow

ENV BASE_DIR /tmp/mlflow
ENV DATABASE_URI sqlite:///${BASE_DIR}/db
ENV ARTIFACT_PATH ${BASE_DIR}/artifacts

RUN mkdir -p $BASE_DIR

COPY create_dummy_data.py .
RUN MLFLOW_TRACKING_URI="${DATABASE_URI}" python create_dummy_data.py

CMD mlflow server --port=5000 --host=0.0.0.0 --backend-store-uri="$DATABASE_URI" --default-artifact-root "$ARTIFACT_PATH"
