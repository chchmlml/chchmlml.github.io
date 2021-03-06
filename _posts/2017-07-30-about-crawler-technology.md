---
layout: post
title: '网络爬虫技术总结'
date: '2017-07-30 13:58:34'
image: '/styles/images/'
description: '今天说说爬虫、 网络爬虫（又被称为网页蜘蛛，网络机器人，在FOAF社区中间，更经常的称为网页追逐者），
                         是一种按照一定的规则，自动地抓取万维网信息的程序或者脚本。另外一些不常使用的名字还
                         有蚂蚁、自动索引、模拟程序或者蠕虫。'
tags:
- 服务器 
- 网络爬虫
categories: 
- 技术
author: 'haicheng'
image:
  feature: 'https://pic2.zhimg.com/50/v2-2c2900d03c3c57659ccb1860b9946549_hd.jpg'
  credit: '@someone'
---

基本原理
===
    网络爬虫（又被称为网页蜘蛛，网络机器人，在FOAF社区中间，更经常的称为网页追逐者），
    是一种按照一定的规则，自动地抓取万维网信息的程序或者脚本。另外一些不常使用的名字还
    有蚂蚁、自动索引、模拟程序或者蠕虫。
    
   我这里说的爬虫则是相对狭义，作为开发，自己做爬虫爬去资料无疑是很有成就感的。
   
爬虫的工作流程
===
- 准备种子URL；
- 将这些URL放入待抓取URL队列；
- 从待抓取URL队列中取出待抓取在URL，解析DNS，并且得到主机的ip，并将URL对应的网页下载下来，存储进已下载网页库中。此外，将这些URL放进已抓取URL队列。
- 分析已抓取URL队列中的URL，分析其中的其他URL，并且将URL放入待抓取URL队列，从而进入下一个循环；
    
要解决的问题
===
- 要获取我们只定的信息，所以可以指定我们需要的格式来定义目标也，通过DOM解析技术从缓存的页面提炼信息，保存指定信息；
- 效率是个大问题，多线程、分布式技术的应用很重要；
- 递归的获取url地址是个类似图数据结构，以何种方式抓取url成为抓取策略，其中有`深度优先遍历策略`、`宽度优先遍历策略`、`反向链接数策略`、`PageRank策略`。

相关资料
===
java、python、Node.js、Go语言因为多线程、协程的支持，非常适合做爬虫语言；php应用多进程方式也可作为爬虫的应用。
- [php爬虫](https://github.com/owner888/phpspider)
- [PHP, Python, Node.js 哪个比较适合写爬虫？](PHP, Python, Node.js 哪个比较适合写爬虫？)

