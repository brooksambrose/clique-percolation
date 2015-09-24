### Goal: Install and execute parallel clique percolation
### Author: Brooks Ambrose (brooksambrose@berkeley.edu)

### install igraph http://igraph.org/c/
sudo apt-get -y install libigraph0 libigraph0-dev

### install COS parallel (Clique percolation On Steroids)
# Enrico Gregori, Luciano Lenzini, Simone Mainardi, "Parallel k-Clique Community Detection on Large-Scale Networks," IEEE Transactions on Parallel and Distributed Systems
# http://ieeexplore.ieee.org/xpls/abs_all.jsp?arnumber=6249683
sudo apt-get -y install subversion
(cd ~/
svn checkout svn://svn.code.sf.net/p/cosparallel/code/trunk cosparallel-code
cd cosparallel-code
./configure
cd extras
make
)

### list maximal cliques http://sourceforge.net/p/cosparallel/wiki/MaximalCliquesListing/
cd ~/clique-percolation
mkdir out49utel
zcat in49/bel2mel-49utel.txt.gz | cut -f1-2 > out49utel/49utel.twocol.txt
cd out49utel
~/cosparallel-code/extras/maximal_cliques 49utel.twocol.txt
~cosparallel-code/cos -P 1 49utel.twocol.txt.mcliques

