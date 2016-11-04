#!/bin/sh
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cula/lib64:/usr/local/cuda/lib:/usr/local/cuda/cudaprof/bin:/usr/local/cuda/lib64
export PATH=$PATH:/usr/kerberos/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/cuda/bin:/usr/local/cuda/cudaprof/bin:$HOME/bin
export LANG=ja_JP.UTF-8


cd hatena

rm -rf keywordlist_furigana.csv*

wget --no-check-certificate http://d.hatena.ne.jp/images/keyword/keywordlist_furigana.csv

ruby ./conv_hatena.rb

mecab-dict-index -d $IPADIC -u hatena.dic -f utf-8 -t utf-8 hatena.csv

rm -rf keywordlist_furigana.csv


cd ..
