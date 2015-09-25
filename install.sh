### Goal: Install and execute parallel clique percolation
### Author: Brooks Ambrose (brooksambrose@berkeley.edu)

### Install igraph http://igraph.org/c/
sudo apt-get -y install libigraph0 libigraph0-dev

### Install COS parallel (Clique percolation On Steroids)
# Enrico Gregori, Luciano Lenzini, Simone Mainardi, "Parallel k-Clique Community Detection on Large-Scale Networks," IEEE Transactions on Parallel and Distributed Systems
# http://ieeexplore.ieee.org/xpls/abs_all.jsp?arnumber=6249683
# http://sourceforge.net/p/cosparallel/wiki
sudo apt-get -y install subversion
(cd ~/
svn checkout svn://svn.code.sf.net/p/cosparallel/code/trunk cosparallel-code
cd cosparallel-code
./configure
make
cd extras
make
)

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
