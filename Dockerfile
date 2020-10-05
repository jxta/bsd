FROM python:3

RUN pip install papermill[all]
RUN pip install jupyter jupyterhub

ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
RUN pip install sagemath
RUN jupyter kernelspec install ./SageMath/local/share/jupyter/kernels/sagemath
USER ${NB_USER}
