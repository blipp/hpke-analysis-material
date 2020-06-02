# An Analysis of Hybrid Public Key Encryption

Supplementary material for
[ia.cr/2020/243](https://ia.cr/2020/243). This write-up is for
[an outdated version of the draft](https://tools.ietf.org/html/draft-irtf-cfrg-hpke-02).

## CryptoVerif

We use CryptoVerif 2.02 which is available from
[cryptoverif.inria.fr](https://cryptoverif.inria.fr).

We refer to the readme file included with the CryptoVerif distribution
for further instructions for building and running.

## Files

### HPKE

This analysis of HPKE is for [an outdated version of the draft](https://tools.ietf.org/html/draft-irtf-cfrg-hpke-02).
The security notions used in this analysis are an ongoing work.

- hpke.m4.cv: this file serves to generate the files for all modes,
  scenarios, and variants described in Section 5.
- run: this script generates the individual model files from hpke.m4.cv.
  It expects CryptoVerif to be located at ../../cryptoverif. We suggest
  you place the files of this repository in a subdirectory
  `examples/hpke` inside the extracted CryptoVerif download.
- TIMES: proof runtimes for all proved models.

### DHKEM

An analysis of the current version of DHKEM, which is part of [version 4
of the HPKE draft](https://tools.ietf.org/html/draft-irtf-cfrg-hpke-04),
has been added to this repository. The security notions used in this
analysis are an ongoing work.

- dhkem.m4.cv: this file serves to generate the files for all modes,
  scenarios, and variants.
- dhkem.run.sh: this script generates the individual model files from
  dhkem.m4.cv.

#### Running the proofs

The Bash script `./run` can be used to generate all model files and
run our entire analysis (for HPKE). It accepts one optional parameter.
If none is given, the script generates the individual model files and
runs all the proofs in CryptoVerif. The Bash script `./dhkem.run.sh`
works in the same way.

The first parameter is `true` by default. If called with `false`, the
script will only generate the models using the preprocessor m4, but
not start their analysis using CryptoVerif.
