# An Analysis of Hybrid Public Key Encryption

Supplementary material for
[ia.cr/2020/243](https://ia.cr/2020/243).

## CryptoVerif

We use CryptoVerif 2.02 which is available from
[cryptoverif.inria.fr](https://cryptoverif.inria.fr).

We refer to the readme file included with the CryptoVerif distribution
for further instructions for building and running.

## Files

- hpke.m4.cv: this file serves to generate the files for all modes,
  scenarios, and variants described in Section 5.
- run: this script generates the individual model files from hpke.m4.cv.
  It expects CryptoVerif to be located at ../../cryptoverif. We suggest
  you place the files of this repository in a subdirectory
  `examples/hpke` inside the extracted CryptoVerif download.
- TIMES: proof runtimes for all proved models.

#### Running the proofs

The Bash script `./run` can be used to generate all model files and
run our entire analysis. It accepts one optional parameter. If none
is given, the script generates the individual model files and runs
all the proofs in CryptoVerif.

The first parameter is `true` by default. If called with `false`, the
script will only generate the models using the preprocessor m4, but
not start their analysis using CryptoVerif.
