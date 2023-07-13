# Start with JupyterHub image.
FROM jupyter/base-notebook:hub-1.4.2

LABEL maintainer="James Gebbie-Rayet <james.gebbie@stfc.ac.uk>"

# Root to install "rooty" things.
USER root

# Update the OS and install software dependencies
# needing root.
RUN apt-get update && apt-get -yq dist-upgrade \
 && apt-get install -yq --no-install-recommends \
    sed \
    git \
    g++ \
    nano \
    openssh-client \
    rsync \
    vim \
    wget \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Switch to jovyan user.
USER $NB_USER
WORKDIR $HOME

# Export important paths.
ENV PATH=/home/jovyan/.local/bin:$PATH

# Remove work directory as it not required.
RUN rm -r $HOME/work

# Change the loooong default terminal string
RUN echo 'export PS1="\u:\W\$ "' >> /home/jovyan/.bashrc

RUN conda install mdtraj -y
RUN conda install matplotlib -y
RUN conda install numpy -y
RUN conda install pandas -y
RUN conda install ipywidgets -c conda-forge -y
RUN conda install nglview

# Python Dependencies for the md_workshop
RUN pip install jupyterhub-tmpauthenticator
RUN pip install fileupload

# Initialise Jupyter Plugins.
RUN jupyter-nbextension install fileupload --py --sys-prefix && \
    jupyter-nbextension enable fileupload --py --sys-prefix

# Get workshop files and move them to jovyan directory.
RUN git clone https://github.com/CCPBioSim/python-and-data-workshop.git && \
    mv python-and-data-workshop/* . && \
    rm -r _config.yml AUTHORS README.md python-and-data-workshop

COPY jupyter_notebook_config.py /etc/jupyter/

# Always finish with non-root user as a precaution.
USER $NB_USER
