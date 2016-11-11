### Goal: Test installation of cosparallel
### Author: Brooks Ambrose (brooksambrose@berkeley.edu)


### Description of maximal cliques analysis
~/cosparallel-code/extras/maximal_cliques

### Description of cos analysis
~/cosparallel-code/cos

### Test on 1900-1949 data as smaller UT-CR-UT network
cd ~/clique-percolation
mkdir out49utel
zcat in49/bel2mel-49utel.txt.gz | cut -f1-2 > out49utel/49utel.twocol.txt
cd out49utel
time ~/cosparallel-code/extras/maximal_cliques 49utel.twocol.txt
time ~/cosparallel-code/cos -P 1 -W 29.9 49utel.twocol.txt.mcliques

### Test on 1900-1949 data as larger CR-UT-CR network
cd ~/clique-percolation
mkdir out49crel
zcat in49/bel2mel-49crel.txt.gz | cut -f1-2 > out49crel/49crel.twocol.txt
cd out49crel
time ~/cosparallel-code/extras/maximal_cliques 49crel.twocol.txt
time ~/cosparallel-code/cos -P 1 -W 29.9 49crel.twocol.txt.mcliques

### Time to run install.sh including tests:
