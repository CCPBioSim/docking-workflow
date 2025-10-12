# Start with BioSim base image.
ARG BASE_IMAGE=latest
FROM ghcr.io/ccpbiosim/jupyterhub-base:$BASE_IMAGE

LABEL maintainer="James Gebbie-Rayet <james.gebbie@stfc.ac.uk>"
ARG TARGETPLATFORM

# Switch to jovyan user.
USER $NB_USER
WORKDIR $HOME

# Install workshop deps
RUN mamba install oddt::oddt -y
RUN mamba install termcolor matplotlib seaborn pandas openbabel vina

# Get workshop files and move them to jovyan directory.
COPY --chown=1000:100 . .
RUN rm -rf chimerax_commands.cxc LICENSE README.md docking_with_rescoring docker .git .github

# Copy lab workspace
COPY --chown=1000:100 docker/default-37a8.jupyterlab-workspace /home/jovyan/.jupyter/lab/workspaces/default-37a8.jupyterlab-workspace

# Always finish with non-root user as a precaution.
USER $NB_USER
