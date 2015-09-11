### Goal: Install and execute parallel clique percolation
### Author: Brooks Ambrose (brooksambrose@berkeley.edu)

### install igraph http://igraph.org/c/
sudo apt-get install libigraph0 libigraph0-dev

### install COS parallel (Clique percolation On Steroids)
# Enrico Gregori, Luciano Lenzini, Simone Mainardi, "Parallel k-Clique Community Detection on Large-Scale Networks," IEEE Transactions on Parallel and Distributed Systems
# http://ieeexplore.ieee.org/xpls/abs_all.jsp?arnumber=6249683
sudo apt-get install subversion
(cd ~/
svn checkout svn://svn.code.sf.net/p/cosparallel/code/trunk cosparallel-code
cd cosparallel-code
./configure
)

### list maximal cliques http://sourceforge.net/p/cosparallel/wiki/MaximalCliquesListing/

#TODO maximal cliques expects unweighted edgelist; how to load from .gz and exclude third column (weights)
#TODO how to manage input and output for each data source

### run cosparallel, accepting input from maximal cliques and original weighted edgelist http://sourceforge.net/p/cosparallel/wiki/UserGuide/
# zcat in49/bel2mel-49zcrel.txt.gz | cut -f1-2
# to save into a file:
# zcat in49/bel2mel-49zcrel.txt.gz | cut -f1-2 > zcrel.twocol.txt
