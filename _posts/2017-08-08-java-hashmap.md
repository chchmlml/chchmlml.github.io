---
layout: post
title: 'HashMap 和 HashTable 源码学习和面试总结'
date: '2017-08-08 09:26:03'
description: 'HashMap 和 HashTable 是各种面试问滥的问题，掌握好理解好也是对java学习上必要的课程。'
categories: 
- 技术
tags:
- java

location:
author: 'haicheng'
---

 
 


# Java集合概述

本文重点总结HashMap，HashMap是基于哈希表实现的，每一个元素是一个key-value对，其内部通过单链表解决冲突问题，容量不足（超过了阀值）时，同样会自动增长。

HashMap是非线程安全的，只用于单线程环境下，多线程环境下可以采用concurrent并发包下的concurrentHashMap。

HashMap 实现了Serializable接口，因此它支持序列化。

HashMap还实现了Cloneable接口，故能被克隆。

# HashMap介绍

### HashMap有四个构造方法，方法中有两个很重要的参数：初始容量和加载因子
这两个参数是影响HashMap性能的重要参数，其中容量表示哈希表中槽的数量（即哈希数组的长度），初始容量是创建哈希表时的容量（默认为16），加载因子是哈希表当前key的数量和容量的比值，当哈希表中的条目数超出了加载因子与当前容量的乘积时，则要对该哈希表提前进行 resize 操作（即扩容）。如果加载因子越大，对空间的利用更充分，但是查找效率会降低（链表长度会越来越长）；如果加载因子太小，那么表中的数据将过于稀疏（很多空间还没用，就开始扩容了），严重浪费。

# 关于HashMap的几个经典问题

### 说下hashmap的 扩容机制？
前面说了，hashmap的构造器里指明了两个对于理解HashMap比较重要的两个参数 int initialCapacity, float loadFactor,这两个参数会影响HashMap效率，HashMap底层采用的散列数组实现，利用initialCapacity这个参数我们可以设置这个数组的大小，也就是散列桶的数量，但是如果需要Map的数据过多，在不断的add之后，这些桶可能都会被占满，这是有两种策略，一种是不改变Capacity，因为即使桶占满了，我们还是可以利用每个桶附带的链表增加元素。

### HashMap的key和value都能为null么？如果k能为null，那么它是怎么样查找值的？
如果key为null，则直接从哈希表的第一个位置table[0]对应的链表上查找。记住，key为null的键值对永远都放在以table[0]为头结点的链表中。

### HashMap中put值的时候如果发生了冲突，是怎么处理的？
JDK使用了链地址法，hash表的每个元素又分别链接着一个单链表，元素为头结点，如果不同的key映射到了相同的下标，那么就使用头插法，插入到该元素对应的链表。

### HashTable和HashMap的区别有哪些？
HashMap和Hashtable都实现了Map接口，但决定用哪一个之前先要弄清楚它们之间的分别。主要的区别有：线程安全性，同步(synchronization)，以及速度。

理解HashMap是Hashtable的轻量级实现（非线程安全的实现，hashtable是非轻量级，线程安全的），都实现Map接口，主要区别在于：

 1、由于HashMap非线程安全，在只有一个线程访问的情况下，效率要高于HashTable

 2、HashMap允许将null作为一个entry的key或者value，而Hashtable不允许。

 3、HashMap把Hashtable的contains方法去掉了，改成containsValue和containsKey。因为contains方法容易让人引起误解。

 4、Hashtable继承自陈旧的Dictionary类，而HashMap是Java1.2引进的Map 的一个实现。

 5、Hashtable和HashMap扩容的方法不一样，HashTable中hash数组默认大小11，扩容方式是 old*2+1。HashMap中hash数组的默认大小是16，而且一定是2的指数，增加为原来的2倍，没有加1。


# HashMap 和 HashTable 比较

HashTable同样是基于哈希表实现的，其实类似HashMap，只不过有些区别，HashTable同样每个元素是一个key-value对，其内部也是通过单链表解决冲突问题，容量不足（超过了阀值）时，同样会自动增长。

HashTable 是线程安全的，能用于多线程环境中。Hashtable同样也实现了Serializable接口，支持序列化，也实现了Cloneable接口，能被克隆。


[源博](https://zhuanlan.zhihu.com/p/24338517)
