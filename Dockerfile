# Dockerfile for binder
# Reference: https://mybinder.readthedocs.io/en/latest/dockerfile.html#preparing-your-dockerfile

FROM sagemath/sagemath:9.1-py3

RUN sage -pip install jupyterlab jupyterhub notebook_autorun

# Copy the contents of the repo in ${HOME}
COPY --chown=sage:sage . ${HOME}

