# FROM python:3
# FROM sharptrick/sage-notebook
FROM cemulate/sagemath-jupyterlab

RUN apt-get install pip
RUN pip install papermill[all]
RUN pip install jupyter jupyterhub

ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

# RUN adduser --disabled-password \
#    --gecos "Default user" \
#    --uid ${NB_UID} \
#    ${NB_USER}

COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}


