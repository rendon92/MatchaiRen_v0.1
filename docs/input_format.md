# Input file formats for MatchaiRen

This document describes the required input files and their expected formats.
All files must be **tab-separated (TSV)** and include headers unless stated otherwise.

---

## 1. Differentially expressed genes (DEGs)

**Path:**
```
data/degs/all_degs.tsv
```

**Required columns:**
```
p_val	avg_log2FC	pct.1	pct.2	p_val_adj	cluster	gene	pct.ratio
```
Description:

gene: gene identifier (zebrafish gene names expected)

cluster: cell type or cluster name

Other columns follow standard Seurat DEG outputs

2. Differentially open chromatin regions (DOCRs)
**Path:**
```
data/docrs/all_docrs.tsv
```
Required columns:
```
p_val	avg_log2FC	pct.1	pct.2	p_val_adj	cluster	gene	pct.ratio
```
Notes:

The gene column contains genomic coordinates in the format:


```
chr-start-end
```
Example:

```
17-28845616-28846715
```
3. Zebrafish–Mouse orthologs


Path:


```
reference/orthologs/zebra_mouse.tsv
```
Format (no header):


```
zebrafish_gene	mouse_gene
```
Example:


```
ppardb	Ppard
igfbp2a	Igfbp2
```

4. Zebrafish–Human orthologs
Path:


```
reference/orthologs/zebra_human.tsv
```

Format (no header):


```
zebrafish_gene	human_gene
```

Example:


```
a1cf	A1CF
aaas	AAAS
```

5. Zebrafish genome annotation (GTF)
Path:
```
reference/annotations/Danio_rerio.gtf

```
Format:

Standard GTF format

Tested with Ensembl GRCz11

6. Zebrafish genome sequence (FASTA)
Path:


```
reference/genomes/Danio_rerio.fa
```

Format:

Standard FASTA format

Must match the genome build used in the GTF file

Notes
The pipeline will fail if any required input file is missing.

No example data are provided in this repository due to size constraints.
