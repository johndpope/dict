#!/bin/env python
# coding:utf-8

import urllib
import urllib2
from lxml import etree
import time
import re
import datetime
import sys
import codecs

def get():
    sys.stdout = codecs.getwriter('utf_8')(sys.stdout)
    #url="http://www.weblio.jp/cat/business/dowsh/"
    url="http://www.weblio.jp/cat/"
    res=urllib.urlopen(url)
    page=res.read()
    root=etree.fromstring(page,etree.HTMLParser())
    get_weblio(root)
    time.sleep(1)
    return


def get_weblio(root):
  elems=root.xpath('//div[@id="main"]/div[@class="mainCntBx"]//div[@class="mainWL"]//a')
  for elem in elems:
    #url=elem.attrib['href'].replace("category","category/business/dowsh")
    url=elem.attrib['href']
    list=get_pageall(url)
    for line in list:
      print line

def get_pageall(url):
  #print "url="+str(url)
  list=[]
  list.extend(get_page(url,"CtgryUlL"))
  list.extend(get_page(url,"CtgryUlR"))
  for no in range(2,999):
    #print "no="+str(no)
    tmp=get_page(url+"/"+str(no),"CtgryUlL")
    if len(tmp)==0:
      return(list)
    list.extend(tmp)
    tmp2=get_page(url+"/"+str(no),"CtgryUlR")
    if len(tmp2)==0:
      return(list)
    list.extend(tmp2)

def get_page(url,cls):
  time.sleep(1)
  list=[]
  res=urllib.urlopen(url)
  page=res.read()
  root=etree.fromstring(page,etree.HTMLParser())
  elems=root.xpath('//ul[@class="'+cls+'"]/li/a')
  for elem in elems:
    #print elem.text
    list.append(elem.text)
  return (list)

if __name__ == '__main__':
  get()
