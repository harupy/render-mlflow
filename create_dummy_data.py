import random

import mlflow
import mlflow.pyfunc


class DummyModel(mlflow.pyfunc.PythonModel):
    def predict(self, context, model_input):
        return 0


def main():
    for _ in range(3):
        with mlflow.start_run():
            mlflow.log_param("p", random.random())
            mlflow.log_param("m", random.random())
            mlflow.set_tag("t", str(random.random()))

            mlflow.pyfunc.log_model(
                "model", python_model=DummyModel(), registered_model_name="pyfunc"
            )


if __name__ == "__main__":
    main()
