FROM python:3.8-slim

LABEL maintainer="Dominic Davis-Foster <dominic@davis-foster.co.uk>"

RUN apt-get update && \
    apt-get install --no-install-recommends -y graphviz imagemagick make gcc python3-dev git pandoc && \
    apt-get autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install --no-cache-dir -U pip
RUN python3 -m pip install --no-cache-dir Sphinx==3.3.1 Pillow

ADD entrypoint.py /entrypoint.py
ADD sphinx_action /sphinx_action

ENTRYPOINT ["/entrypoint.py"]
