FROM mambaorg/micromamba:1.5.8

# Evita prompts y acelera
ENV MAMBA_DOCKERFILE_ACTIVATE=1

WORKDIR /work

# Copiamos solo el entorno (capa cacheable)
COPY matchairen.yaml /tmp/env.yaml

RUN micromamba create -y -n matchairen -f /tmp/env.yaml && \
    micromamba clean --all --yes

ENV PATH=/opt/conda/envs/matchairen/bin:$PATH

# Copiamos el código
COPY . /work

# Snakemake por defecto, pero flexible
ENTRYPOINT ["snakemake"]
CMD ["--help"]

