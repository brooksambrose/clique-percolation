
### list maximal cliques http://sourceforge.net/p/cosparallel/wiki/MaximalCliquesListing/
cd ~/clique-percolation
mkdir out49utel
zcat in49/bel2mel-49utel.txt.gz | cut -f1-2 > out49utel/49utel.twocol.txt
cd out49utel
~/cosparallel-code/extras/maximal_cliques 49utel.twocol.txt
~/cosparallel-code/cos -h
~/cosparallel-code/cos -P 1 49utel.twocol.txt.mcliques

#TODO maximal cliques expects unweighted edgelist; how to load from .gz and exclude third column (weights)
#TODO how to manage input and output for each data source

### run cosparallel, accepting input from maximal cliques and original weighted edgelist http://sourceforge.net/p/cosparallel/wiki/UserGuide/
# zcat in49/bel2mel-49zcrel.txt.gz | cut -f1-2
# to save into a file:
# zcat in49/bel2mel-49zcrel.txt.gz | cut -f1-2 > zcrel.twocol.txt
# ~/cosparallel-code/extras/maximal_cliques $(zcat in49/bel2mel-49utel.txt.gz | cut -f1-2)
