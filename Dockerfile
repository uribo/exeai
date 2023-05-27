FROM python:3.10.11-slim-buster@sha256:db07f5bb942084a04995a26250c1294373de8b7ca2c2ed0fc31120cc73ed8618

# install quarto dependencies


RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git \
    pandoc \
    pandoc-citeproc \
    curl \
    gdebi-core && \
    rm -rf /var/lib/apt/lists/* && \
    pip install --upgrade pip

RUN curl -LO https://github.com/quarto-dev/quarto-cli/releases/download/v1.3.361/quarto-1.3.361-linux-amd64.deb
RUN gdebi --non-interactive quarto-1.3.361-linux-amd64.deb

COPY ./requirements.txt .

RUN pip install -r requirements.txt
