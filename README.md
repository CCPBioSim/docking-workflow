# CCPBioSim Docking Workshop

[![build](https://github.com/ccpbiosim/docking-workflow/actions/workflows/build.yaml/badge.svg?branch=main)](https://github.com/ccpbiosim/docking-workflow/actions/workflows/build.yaml)

This is a repository for a set of Jupyter notebooks to create a workflow for docking ligands to multiple protein receptors and analysing the results.

Dependencies:
1. Jupyter
2. ChimeraX (or Chimera, but we recommend the newer ChimeraX)
3. AutoDock Vina
4. Vina Split
5. OpenBabel with Python bindings
6. OpenDrugDiscovery

If you are using the prepared docker container, all the requirements are installed except ChimeraX.

To install ChimeraX, go to https://www.rbvi.ucsf.edu/chimerax/download.html and download the correct version for your operating system (you will need to click on other releases to find the linux version) and follow the instructions in the notes column on the website. This is for personal non-commercial use.

If results are published, please cite all of the software that you used.
https://vina.scripps.edu/manual/#citation
https://www.rbvi.ucsf.edu/chimerax/docs/credits.html

## Docker

This container is derived from the CCPBioSim JupyterHub image. This container
adds the necessary software packages and notebook content to form a deployable
course container. The source content for this course can be found at
https://github.com/CCPBioSim/docking-workflow

## How to Use

In our containers we are using the JupyterHub default port 8888, so you should
forward this port when deploying locally::

    docker run -p 8888:8888 ghcr.io/ccpbiosim/docking-workshop:latest



