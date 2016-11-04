#!/bin/sh
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cula/lib64:/usr/local/cuda/lib:/usr/local/cuda/cudaprof/bin:/usr/local/cuda/lib64
export PATH=$PATH:/usr/kerberos/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/cuda/bin:/usr/local/cuda/cudaprof/bin:$HOME/bin
export LANG=ja_JP.UTF-8


# weblio 証券用語
cd weblio


python weblio.py > weblio_data.csv 

ruby ./conv_weblio.rb

mecab-dict-index -d $IPADIC -u weblio.dic -f utf-8 -t utf-8 weblio.csv

rm -rf weblio_data.csv


cd ..
