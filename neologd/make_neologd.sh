#!/bin/sh
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cula/lib64:/usr/local/cuda/lib:/usr/local/cuda/cudaprof/bin:/usr/local/cuda/lib64
export PATH=$PATH:/usr/kerberos/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/cuda/bin:/usr/local/cuda/cudaprof/bin:$HOME/bin
export LANG=ja_JP.UTF-8
export PATH=/opt/ruby/bin:$PATH

cd neologd

if [ -d mecab-ipadic-neologd ];then
  rm -rf mecab-ipadic-neologd
fi
echo "git clone https://github.com/neologd/mecab-ipadic-neologd.git"
git clone https://github.com/neologd/mecab-ipadic-neologd.git

cd mecab-ipadic-neologd/seed

fname=""
fwk=`ls *xz` > /dev/null
if [ $? = 0 ];then
  fname=${fwk%.*}
  xz --decompress $fwk
fi

fname=`ls mecab*csv`
echo "fname=$fname"
if [ "$fname" = "" ];then
  echo "do nothing"
  cd ..
else

  cat $fname |sed 's/$/,neologd/' > ../${fname}.txt
  cd ..
  mecab-dict-index -d $IPADIC -u ../neologd.dic -f utf-8 -t utf-8 ${fname}.txt
fi
cd ..
