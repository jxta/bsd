FROM python:3

RUN pip install papermill[all]
RUN pip install jupyter

ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}
