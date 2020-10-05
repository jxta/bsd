FROM python:3

RUN pip install papermill[all]
RUN pip install jupyter

ENV NB_USER jovyan
ENV NB_GROUP users

COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}
