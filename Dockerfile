FROM sharptrick/sage-notebook

RUN sudo apt-get update
RUN sudo apt-get install python-pip -y
RUN sudo apt-get install python3 -y
RUN pip install --upgrade pip
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


