---
layout: post
title: '《redis设计与实践》学习'
date: '2017-08-07 11:04:42'
image: '/styles/images/'
description: '《redis设计与实践》读书笔记'
categories:
- 技术
tags:
- redis
- 读书笔记
---

 
 


# 引言

# 数据结构与对象

### 简单动态字符串 SDS

    redis用C的字符串作为字面量，SDS取而代之。好处
    获取长度常量复杂度
    杜绝缓冲溢出
    减少长度修改分配内存次数
    二进制安全
    兼容部分C字符串

### 链表

    用途较广、订阅、慢查询等
    链表节点listNode结构、双向链表
    链表为list结构有头尾结构信息，长度信息
    头结点头指向、尾节点尾指向null
    节点保存不同类型
    
### 字典

    字典的实现是hash表
    使用链表地址解决冲突
### 跳跃表

    有续集集合实现之一
    层高1到32随机数
    按节点值大小排序
### 整数集合

    集合的实现之一
    底层数组实现，可以有序、无序，无重复的保存
    升级操作节约内存
    不支持降级

### 压缩列表
### 对象

    redis的键值对的键和值都是一个对象
    redis有字符串、 列表、hash、集合、有序集合五种类型，每种有至少两种以上编码
    不同编码效率不同
    
    执行命令之前会检查特定的键是否可以执行这个命令
    对象都带有计数垃圾回收机制
    共享0到9999的字符串对象
    每次最后的访问时间会被对象记录，计算空间的回转时间

# 单机数据库实现

### 数据库

    保存在redisserver.db中
    客户端修改数据库指针，指向redisserver.db中指针切换数据库
    数据库由dict、exprise组成，保存键值对和过期时间

### RDB持久化

    RDB文件保存和还原数据库所有数据
    SAVE命令服务器进程保存操作，阻塞数据库
    BSAVE子进程保存数据，不会阻塞数据库
    RDB文件是二进制的
    不同数据RDB保存格式不一样
    
### AOF持久化
    ·AOF文件通过保存所有修改数据库的写命令请求来记录服务器的数据库状态。
    ·AOF文件中的所有命令都以Redis命令请求协议的格式保存。
    ·命令请求会先保存到AOF缓冲区里面，之后再定期写入并同步到AOF文件。

### 事件

    redis是事件驱动
    文件事件、时间事件
    文件时间读时间、写事件
    时间事件分为定时和周期事件
    
### 客户端
### 服务器

# 多机数据库实现

### 复制

    旧版文件同步
    新版支持点复制，也就是偏移量复制
    
### sentinel

    监控redis
    
### 集群

    分片、按槽处理自己的键值

# 独立功能实现
### 发布订阅
### 事务
### lua脚本
### 排序
### 二进制数组
### 慢查询日志


