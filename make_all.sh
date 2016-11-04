#!/bin/sh
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cula/lib64:/usr/local/cuda/lib:/usr/local/cuda/cudaprof/bin:/usr/local/cuda/lib64
export PATH=$PATH:/usr/kerberos/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/cuda/bin:/usr/local/cuda/cudaprof/bin:$HOME/bin
export LANG=ja_JP.UTF-8

export PATH=/opt/ruby/bin:$PATH
cd $HOME/dictionary


bash hatena/make_hatena.sh
#bash kwuniv/make_kwuniv.sh
bash neologd/make_neologd.sh
#bash refinekw/make_refinekw.sh
bash stock/make_stock.sh
bash wikipedia/make_wiki.sh
#bash youjikw/make_youjikw.sh
