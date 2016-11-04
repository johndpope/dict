#!/bin/env ruby 
# coding:utf-8

require "pp"

in_file = File::open( "kwuniv.txt" )

# 出力ファイル（hatena.csvというファイルを出力します）
out_file = File::open( "kwuniv.csv", 'w' )

i = 0

# 1行ずつ読み込み、out_fileに出力していく
while line = in_file.gets

  # EUC-JPのファイルなので、使用しているUTF-8に変換（ついでにtrim）
  # システム辞書でEUCを使用している場合は、toutf8は削ってください
  line = line.strip

  # タブ区切り（仮名\t単語）になっているので、split
  kana="*"
  word=line
  spword=line

  # コストの計算
  cost = [-36000,-400*word.size**1.5].max

  # 行出力 
  out_file.puts "#{word},-1,-1,#{cost},名詞,一般,*,*,*,*,#{word},#{kana},#{kana},kwuniv"

  puts "#{i.to_s}件目を処理" if ( i += 1 ) % 1000 == 0
  # break if i > 3000
end

in_file.close
out_file.close

