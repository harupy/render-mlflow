import random

import mlflow


def main():
    for _ in range(3):
        with mlflow.start_run():
            mlflow.log_param("p", random.random())
            mlflow.log_param("m", random.random())


if __name__ == "__main__":
    main()
