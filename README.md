![Matchairen pipeline](docs/matchairen_pipeline.png)

# MatchaiRen  
**Reconstruction of Cell-Type Specific Gene Regulatory Networks**

MatchaiRen is a Snakemake pipeline that integrates differential gene expression and
chromatin accessibility data to score transcription factor regulatory networks.

The pipeline combines transcription factor motifs from human and mouse with
ortholog mapping to enable cross-species regulatory inference.

---

## Requirements

- Linux (tested)
- Docker

No local installation of conda, Snakemake, Python or R is required.

---

## Repository structure

```text
.
├── Snakefile
├── config.yaml
├── Dockerfile
├── matchairen.yaml
│
├── data/
│   ├── motifs/        # TF motif databases
│   ├── degs/          # differential gene expression files
│   └── docrs/         # differential chromatin accessibility (peaks)
│
├── reference/
│   ├── genomes/       # reference genome FASTA
│   ├── annotations/   # gene annotations (GTF/GFF)
│   └── orthologs/     # ortholog mappings
│
├── results/           # output directory
│
└── docs/
    ├── matchairen_logo.png
    └── matchairen_pipeline.png
```

---

## Input data

Users must provide and adapt the following inputs according to their organism
and experimental setup.

### Reference data

Located in `reference/`:

- Genome FASTA (`reference/genomes/`)
- Gene annotations (`reference/annotations/`)
- Ortholog tables:
  - species ↔ human
  - species ↔ mouse  
  (`reference/orthologs/`)

Ortholog tables are required because TF motifs from both human and mouse
are used in the analysis.

### Experimental data

Located in `data/`:

- Differentially expressed genes (`data/degs/`)
- Differentially accessible chromatin regions (`data/docrs/`)
- TF motif databases (`data/motifs/`)

---

## Configuration

All file paths and analysis parameters are defined in:

```text
config.yaml
```

Users must edit this file to:
- Specify the organism
- Point to the correct input files
- Adjust analysis parameters

Changing values in `config.yaml` will automatically trigger the appropriate
Snakemake rules.

---

## Running the pipeline with Docker

All commands must be executed from the root of the repository.

### Dry-run (recommended)

Checks that the pipeline is correctly configured without running any jobs:

```bash
docker run --rm \
  -u $(id -u):$(id -g) \
  -e HOME=/work \
  -v $(pwd):/work \
  rendon92/matchairen:0.1 \
  --cores 1 -n
```

### Full execution

```bash
docker run --rm \
  -u $(id -u):$(id -g) \
  -e HOME=/work \
  -v $(pwd):/work \
  rendon92/matchairen:0.1 \
  --cores 4
```

Adjust `--cores` according to available resources.

---

## Output

All results are written to the `results/` directory.

Existing results will not be recomputed unless:
- input files change
- `config.yaml` parameters change
- Snakemake detects provenance changes

---

## Notes

- This pipeline does not download reference data automatically.
- Users are responsible for preparing input files in the expected formats.
- The pipeline has been tested on Linux systems using Docker.

Biological interpretation, scoring methodology and use cases
will be documented in future versions.
