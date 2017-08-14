---
layout: post
title: 'php5 oracle xp'
date: '2017-07-07 13:37:21'
image: '/styles/images/'
description: '这是我的测试文章.'
tags:
- php
categories:
- 编程技术
---

     由于换组，今天不得不把业务熟悉下。新的组长要求我在本地进行程序编写及测试，所以。不得不搭建PHP的本地环境。虽然有傻瓜式的集成环境搭建工具，但是都是基于MySQL的，可是我需要搭建Oracle的本地环境，连接线上的数据库，想想就头痛。
因为以前自己测试过xampp搭建xp/php5/oracle，所以这次选用的是xampp，抛弃了一直用的wamp。一开始都很顺利，可是老问题也来了。
1.安装orl client
2.修改php.ini，打开php_oci.dll等扩展dll
重启apache，结果和我想的一样，木有用哭，还是报哪个“找不到php_oci8.php模块”。
能怎么办，度娘，google呗。查了半天，有了点眉目，有的资料上说php在xp平台上支持oci的最低版本是10g，没办法试一下吧，我把自己的已安装的9g卸掉，下了个10g的版本，地址ed2k://%7Cfile%7C%5BOracle.10g.For.Windows%5D.Oracle.10g.for.Windows.ISO%7C650379264%7C6cc207b3996489dd0998e4354a929481%7Ch=w3j5oxjfere6le6kykjxfwoymgojzhs3%7C/ 花了半天安上，重启apache（表示平静，打击多了也就不兴奋了）结果依旧抓狂。
继续查资料，这是找到了个有点靠谱的文章，地址http://blog.sina.com.cn/s/blog_56e9c93c01000ace.html 所以我又下了个instantclient10（我已经收藏到我的资源里了），并把里面的oraociei10.dll 和orannzsbb10.dll 和oci.dll 复制到php的ext（个人觉得只要在环境变量里就行），重启apache，好了，出现了oci8的支持。可怜。
当然我还借鉴了其他的文章，跟大家分享下http://bbs.phpchina.com/thread-44502-1-1.html


