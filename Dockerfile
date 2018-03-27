# This is a dockerfile for a mostly complete jupyter notebook which contains Haskell, Julia, Python and R
# It is derived from jupyter/datascience-notebook and adds Haskell support
# IHaskell support is added by following and automizing Linux build instructions for IHaskell (https://github.com/gibiansky/IHaskell)

FROM jupyter/datascience-notebook

# fetching dependencies is done as root
USER root

RUN apt-get update
RUN apt-get install -y python3-pip git libtinfo-dev libzmq3-dev libcairo2-dev libpango1.0-dev libmagic-dev libblas-dev liblapack-dev

RUN curl -sSL https://get.haskellstack.org/ | sh

# stack is sensitive about users and groups so everything now happens as local user
# for some reason our local user is 'jovyan' and our local group is 'users'
# we prepare by giving this user ownership
RUN chown -R jovyan:users /srv

USER jovyan

# We then clone IHaskell in there and switch into the newly cloned repository
WORKDIR /srv
RUN git clone https://github.com/gibiansky/IHaskell
WORKDIR /srv/IHaskell

# This is directly based on IHaskell build instructions
RUN pip3 install -r requirements.txt
RUN stack install gtk2hs-buildtools
RUN stack install --fast

# because ihaskell isn't in our PATH value we just run it locally
RUN /home/jovyan/.local/bin/ihaskell install --stack
