FROM python:3.10.12-slim-buster@sha256:2daf07926ccdff5dbeef6bee46cc5bb07322f417c102609601177a1559156385

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git \
    pandoc \
    pandoc-citeproc \
    curl \
    gdebi-core && \
    rm -rf /var/lib/apt/lists/* && \
    pip install --upgrade pip

RUN curl -LO https://github.com/quarto-dev/quarto-cli/releases/download/v1.3.450/quarto-1.3.450-linux-amd64.deb
RUN gdebi --non-interactive quarto-1.3.450-linux-amd64.deb

COPY ./requirements.txt .

RUN pip install -r requirements.txt
