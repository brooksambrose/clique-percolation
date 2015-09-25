### Goal: After install, run clique percolation on entire 1990-1999 data
### Author: Brooks Ambrose (brooksambrose@berkeley.edu)

### Test on 1900-1999 data as smaller UT-CR-UT network
cd ~/clique-percolation-data
mkdir out99utel
time zcat in99/bel2mel-99utel.txt.gz | cut -f1-2 > out99utel/99utel.twocol.txt
cd out99utel
time ~/cosparallel-code/extras/maximal_cliques 99utel.twocol.txt
time ~/cosparallel-code/cos -P 1 -W 29.9 99utel.twocol.txt.mcliques

### Test on 1900-1999 data as larger CR-UT-CR network
cd ~/clique-percolation-data
mkdir out99crel
time zcat in99/bel2mel-99crel.txt.gz | cut -f1-2 > out99crel/99crel.twocol.txt
cd out99crel
time ~/cosparallel-code/extras/maximal_cliques 99crel.twocol.txt
time ~/cosparallel-code/cos -P 1 -W 29.9 99crel.twocol.txt.mcliques

### Total time:
