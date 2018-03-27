# haskell-datascience-notebook
Jupyter Notebook with Haskell, Python, Julia and R Support

## How to use
You can fetch the Image via DockerHub: https://hub.docker.com/r/glor/haskell-datascience-notebook/  
Usage is the same as in https://hub.docker.com/r/jupyter/datascience-notebook/

## How this is built
This Docker Container is based on the datascience-notebook from docker-stacks: https://github.com/jupyter/docker-stacks  
It only extends it by the iHaskell Kernel (using linux build instructions): https://github.com/gibiansky/IHaskell  
See [Dockerfile](./Dockerfile) for details.
