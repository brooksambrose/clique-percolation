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

