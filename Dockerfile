FROM sphinxdoc/sphinx:3.3.1

LABEL "maintainer"="Ammar Askar <ammar@ammaraskar.com>"

RUN apt-get update && apt-get install gcc python3-dev git pandoc -y && apt-get clean

ADD entrypoint.py /entrypoint.py
ADD sphinx_action /sphinx_action

ENTRYPOINT ["/entrypoint.py"]
