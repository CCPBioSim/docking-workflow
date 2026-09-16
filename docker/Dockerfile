# Start with BioSim base image.
ARG BASE_IMAGE=latest@sha256:5eb67b09e3fdf64b3128bd9501e08a0cbb007804b678f2096728d8c1260e6217
FROM ghcr.io/ccpbiosim/jupyterhub-base:$BASE_IMAGE

LABEL maintainer="James Gebbie-Rayet <james.gebbie@stfc.ac.uk>"
ARG TARGETPLATFORM

# Switch to jovyan user.
USER $NB_USER
WORKDIR $HOME

# Install workshop deps
RUN conda install -y -c conda-forge -c oddt \
    conda-forge::matplotlib=3.11.1 \
    conda-forge::numpy=2.3.5 \
    conda-forge::pandas=3.0.5 \
    conda-forge::seaborn=0.13.2 \
    conda-forge::termcolor=3.3.0 \
    conda-forge::vina=1.2.7 \
    oddt::oddt=0.7
RUN pip install --no-cache-dir \
    openbabel-wheel==3.1.1.23

RUN mamba install     

# Get workshop files and move them to jovyan directory.
COPY --chown=1000:100 . .
RUN rm -rf chimerax_commands.cxc LICENSE README.md docking_with_rescoring simple_docking docker .git .github

# Copy lab workspace
COPY --chown=1000:100 docker/default-37a8.jupyterlab-workspace /home/jovyan/.jupyter/lab/workspaces/default-37a8.jupyterlab-workspace

# Always finish with non-root user as a precaution.
USER $NB_USER
