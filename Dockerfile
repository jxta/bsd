FROM jupyter/datascience-notebook
# FROM minidocks/graphviz

RUN pip install papermill[all] 
RUN pip install jupyter jupyterhub ethercalc-python
RUN pip install networkx==2.5.1
RUN pip install graphillion graphviz


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


