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
)

### list maximal cliques http://sourceforge.net/p/cosparallel/wiki/MaximalCliquesListing/
cd ~/clique-percolation
mkdir out49utel
zcat in49/bel2mel-49utel.txt.gz | cut -f1-2 > out49utel/49utel.twocol.txt
cd out49utel
~/cosparallel-code/extras/maximal_cliques 49utel.twocol.txt
~cosparallel-code/cos -P 1 49utel.twocol.txt.mcliques

#zcat in49/bel2mel-49utel.txt.gz | cut -f1-2 | ~/cosparallel-code/extras/maximal_cliques

#TODO maximal cliques expects unweighted edgelist; how to load from .gz and exclude third column (weights)
#TODO how to manage input and output for each data source

### run cosparallel, accepting input from maximal cliques and original weighted edgelist http://sourceforge.net/p/cosparallel/wiki/UserGuide/
# zcat in49/bel2mel-49zcrel.txt.gz | cut -f1-2
# to save into a file:
# zcat in49/bel2mel-49zcrel.txt.gz | cut -f1-2 > zcrel.twocol.txt
# ~/cosparallel-code/extras/maximal_cliques $(zcat in49/bel2mel-49utel.txt.gz | cut -f1-2)


#git command line usage
#oski@BCE:~/clique-percolation$ git add install.sh 
#oski@BCE:~/clique-percolation$ git commit -m 'instructions for using cut on data'
#[master 09c5986] instructions for using cut on data
# 1 file changed, 3 insertions(+)
#oski@BCE:~/clique-percolation$ git push
#Username for 'https://github.com': brooksambrose
#Password for 'https://brooksambrose@github.com': 

#Counting objects: 3, done.
#Compressing objects: 100% (3/3), done.
#Writing objects: 100% (3/3), 388 bytes | 0 bytes/s, done.
#Total 3 (delta 2), reused 0 (delta 0)
#To https://www.github.com/brooksambrose/clique-percolation
#   f6d3ea8..09c5986  master -> master

