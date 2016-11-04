#!/bin/sh
# create stock code file
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cula/lib64:/usr/local/cuda/lib:/usr/local/cuda/cudaprof/bin:/usr/local/cuda/lib64
export PATH=$PATH:/usr/kerberos/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/cuda/bin:/usr/local/cuda/cudaprof/bin:$HOME/bin
export LANG=ja_JP.UTF-8
export PATH=/opt/ruby/bin:$PATH

cd stock


mysql -uroot -hkaad1md -pqr0315 << eof > stock.txt
use live
;
select stockName from stockMasterFull
;
select shortName from stockMasterFull
;
select englishName from stockMasterFull
;
eof


ruby ./conv_stock.rb 

mecab-dict-index -d $IPADIC -u stock.dic -f utf-8 -t utf-8 stock.csv
rm -rf stock.txt

cd ..
