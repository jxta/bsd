FROM python:3

RUN pip install papermill[all]
RUN pip install jupyter
