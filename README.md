# CCPBioSim Docking Workshop

[![ci](https://github.com/ccpbiosim/docking-workflow/actions/workflows/build.yaml/badge.svg?branch=main)](https://github.com/ccpbiosim/docking-workflow/actions/workflows/build.yaml)
[![latest](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fccpbiosim.github.io%2Fworkshop.json&query=%24.containers.docking-workflow.latest&labelColor=grey&logo=github&logoColor=white&label=latest&color=purple)](https://github.com/ccpbiosim/docking-workflow/pkgs/container/docking-workshop)
[![issues](https://img.shields.io/github/issues/ccpbiosim/docking-workflow?logo=github&labelColor=grey)](https://github.com/CCPBioSim/docking-workflow/issues)
[![pr](https://img.shields.io/github/issues-pr/ccpbiosim/docking-workflow?logo=github&labelColor=grey)](https://github.com/CCPBioSim/docking-workflow/pulls)

This workshop source repository contains the build recipe for a docker container derived from the CCPBioSim JupyterHub image. This container adds the necessary software packages and notebook content to form a deployable course container.

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

## How to Use

This training course is deployed on the [CCPBioSim](www.ccpbiosim.ac.uk) website via our cloud infrastructure, however you can deploy on your own machine with docker.

Pull the container from our repository::

    docker pull ghcr.io/ccpbiosim/docking-workflow:latest

In our containers we are using the JupyterHub default port 8888, so you should
forward this port when deploying locally::

    docker run -p 8888:8888 ghcr.io/ccpbiosim/docking-workflow:latest

## Authors

Workshop Content Authors:

- Geoffrey Wells

## Contact

Please direct all questions and feedback to [Geoffrey Wells](mailto:g.wells@ucl.ac.uk)
