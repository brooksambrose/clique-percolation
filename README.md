#clique-percolation

This repo is an implementation of k-clique community detection to study the citation networks of articles in U.S. social science journals from 1900 to 2009. The data are stored in network edgelist format and are derived from the Thompson Reuters™ Web of Knowledge (WOK) database.

#Quick Start

To install software for clique percolation on an Ubuntu system and run a test on sample data, enter these commands:

```
cd ~/
git clone https://github.com/brooksambrose/clique-percolation
cd ~/clique-percolation
time bash -v install.sh
```

If you are successful the bottom of your output will look something like:  

```
Found	43	9-clique-communities  
Found	70	7-clique-communities  
Found	154	5-clique-communities  
Found	58	8-clique-communities  
Found	241	4-clique-communities  
Found	326	3-clique-communities  

real	0m3.358s  
user	0m1.261s  
sys	0m0.515s  
```

#Data

The `in49` and `in99` directories contain the main network edgelist data as compressed text files as described below. The `levels` directory contains compressed text files that are lists of standardized WOK codes in which the order of the list corresponds to the index numbers in the corresponding edgelist files.

##1900-1949

The `in49` directory contains a smaller set of edgelists covering selected journals in the social sciences from 1900 to 1949.

###Original Citations Codes 

- `bel2mel-49crel.txt.gz` is a weighted CR-UT-CR edgelist of 123,055 lines.

CR-UT-CR refers to the WOK codes for cited references (CR) and the record id (UT) of the citing article, thus CR-UT-CR indicates a monopartite network of citations tied by the number of articles containing each in their list of references.

- `bel2mel-49utel.txt.gz` is a weighted UT-CR-UT edgelist of 12,719 lines.

This monopartite edgelist (*mel*, projected from a bipartite edgelist *bel*) is the inverse of `bel2mel-49crel`. It represents a network of articles tied by the number of citations shared in common between their list of references. 

###Resolved Identity Citation Codes

To correct a nontrivial level of error and natural variation in the coding of citations over several decades of citation indexing, a machine learning approach to the identity resolution of WOK citation codes was performed. Files with the `z` prefix refer to error-corrected or resolved identity edgelists. These lists are longer because citations were selected for inclusion in the analysis only if they were cited by more than one article; identity resolution has the consequence of saving otherwise solitary codes from exclusion by subsuming them under a set of identified variations (`z` referring to fu*zz*y sets of variations).

- `bel2mel-49zcrel.txt.gz` is a resolved identity CR-UT-CR edgelist of 139,032 lines.
- `bel2mel-49zutel.txt.gz` is a resolved identity UT-CR-UT edgelist of 15,420 lines.

##1900-2009

The `in99` directory contains larger edgelists covering selected journals in the social sciences from 1900-2009 roughly, including all data from the 1900-1949 subset and with partial coverage extending to 2015. We use the prefix `99` because 1999 will be the extent of the analytical window and to remind the user that these data are later and larger than the `49` data.

- `bel2mel-99crel.txt.gz` is a CR-UT-CR edgelist of 27,303,359 lines.
- `bel2mel-99utel.txt.gz` is a UT-CR-UT edgelist of 13,485,947 lines.
- `bel2mel-99zcrel.txt.gz` is a resolved identity CR-UT-CR edgelist of 27,797,685 lines.
- `bel2mel-99zutel.txt.gz` is a resolved identity UT-CR-UT edgelist of 13,702,183 lines.

#Software

##Berkeley Common Environment

The [BCE is a virtualization project](http://bce.berkeley.edu) led by [Berkeley Research Computing](http://research-it.berkeley.edu/programs/berkeley-research-computing) to create a common environment for statistical computing. The `install.sh` script is intended to be run within BCE but may work in other unix-alike environments.

##Clique Percolation

Clique percolation is a method for detecting k-clique community structure in large graphs. The original [Clique Percolation Method](http://www.cfinder.org) (CPM) is a serial method suitable for smaller graphs. Details of the clique percolation method are described in:

>Palla, G., I. Derényi, I. Farkas, and T. Vicsek. 2005. “[Uncovering the Overlapping Community Structure of Complex Networks in Nature and Society](http://www.nature.com/articles/doi:10.1038%2Fnature03607)” Nature.

We instead implement the parallelized [Clique percolation On Steroids](http://sourceforge.net/p/cosparallel/wiki/Home/) (COS) method to accommodate the larger scale of our data. Details of the COS method are described in:

>Enrico Gregori, Luciano Lenzini, Simone Mainardi, "[Parallel k-Clique Community Detection on Large-Scale Networks](http://ieeexplore.ieee.org/xpls/abs_all.jsp?arnumber=6249683)," IEEE Transactions on Parallel and Distributed Systems 24(8):1651–60.
