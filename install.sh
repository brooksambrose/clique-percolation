### Goal: Install and execute parallel clique percolation
### Author: Brooks Ambrose (brooksambrose@berkeley.edu)

# Sparse checkout: only small data from repo, see README.md for details
rm -fr ~/clique-percolation; mkdir ~/clique-percolation
cd ~/clique-percolation
git init
git remote add origin 'http://www.github.com/brooksambrose/clique-percolation'
git config core.sparsecheckout true
echo '!/in99' > .git/info/sparse-checkout
git pull origin master

### install igraph http://igraph.org/c/
wget 'http://igraph.org/nightly/get/c/igraph-0.7.1.tar.gz'
tar zxvf igraph-0.7.1.tar.gz
cd igraph-0.7.1
./configure
make
make check
make install

### install COS parallel (Clique percolation On Steroids)
# Enrico Gregori, Luciano Lenzini, Simone Mainardi, "Parallel k-Clique Community Detection on Large-Scale Networks," IEEE Transactions on Parallel and Distributed Systems
# http://ieeexplore.ieee.org/xpls/abs_all.jsp?arnumber=6249683
sudo apt-get install subversion
cd ~/clique-percolation
svn checkout svn://svn.code.sf.net/p/cosparallel/code/trunk cosparallel-code
cd cosparallel-code
./configure

# not sure how to install C++ programs...
sudo mv ~/clique-percolation/igraph-0.7.1/include /usr/local/include/igraph
sudo mv ~/clique-percolation/igraph-0.7.1/src /usr/local/src/igraph
cd ~/clique-percolation/cosparallel-code
./configure
make


#TODO unresolved igraph install errors
# ERROR: 223 tests were run,
# 1 failed unexpectedly.
# 11 tests were skipped.

#TODO troubleshoot COS installation
# checking igraph.h usability... no
# checking igraph.h presence... no
# checking for igraph.h... no
# You need to install igraph library/headers (version 0.6 or above)

### clue? http://stackoverflow.com/questions/26435741/trouble-setting-up-igraph-with-c/26443875#26443875

### list maximal cliques http://sourceforge.net/p/cosparallel/wiki/MaximalCliquesListing/

#TODO maximal cliques expects unweighted edgelist; how to load from .gz and exclude third column (weights)
#TODO how to manage input and output for each data source

### run cosparallel, accepting input from maximal cliques and original weighted edgelist http://sourceforge.net/p/cosparallel/wiki/UserGuide/