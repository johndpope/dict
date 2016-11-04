#!/bin/sh
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cula/lib64:/usr/local/cuda/lib:/usr/local/cuda/cudaprof/bin:/usr/local/cuda/lib64
export PATH=$PATH:/usr/kerberos/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/cuda/bin:/usr/local/cuda/cudaprof/bin:$HOME/bin
export LANG=ja_JP.UTF-8
export PATH=/opt/ruby-2.0/bin/:$PATH

cd wikipedia

rm -rf jawiki-latest-all-titles-in-ns0*

wget --no-check-certificate http://download.wikimedia.org/jawiki/latest/jawiki-latest-all-titles-in-ns0.gz
gunzip jawiki-latest-all-titles-in-ns0.gz

ruby ./conv_wiki.rb

mecab-dict-index -d $IPADIC -u wikipedia.dic -f utf-8 -t utf-8 wikipedia.csv

rm -rf jawiki-latest-all-titles-in-ns0*
cd ..
