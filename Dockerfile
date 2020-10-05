FROM python:3

RUN pip install papermill[all]
RUN pip install jupyter

ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}
