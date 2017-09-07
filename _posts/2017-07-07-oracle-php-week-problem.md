---
layout: post
title: 'oracle php week problem'
date: '2017-07-07 13:37:21'
image: '/styles/images/'
description: '这是我的测试文章.'
tags:
- php
categories:
- 编程技术
---


今天遇到了个小问题，项目要求在数据库里查出某一天上一周的数据列，sql语句还好写；
```sql
to_char("date",'ww') >:date  
```
运行，测试。起初还好，几轮测试下来出问题了，总是有那么几天不正确，就是说手算是40周，这是查询时却不是，有可能是41，所以我查了下手册，原来PHP中给日期格式化是这样的
```php
date("W")//当天是当年的第几周，注：每周是从星期一开始  
```
但是在Oracle周的解释是每周是从一月一日算起，所以显而易见会有些问题，所以为了解决我们就最好使他们保持一致，所以我写了下面的算法，跟大家分享下
```php
function get_week_index($month=null, $day=null, $year=null){  
        //拿到某一天的月日年  
        $month =$month?$month: date("m");  
        $day =$day?$day:date("d");   
        $year  =$year?$year: date("Y");  
        //得到那一天的时间戳  
        $getDay = mktime(0, 0, 0, $month, $day, $year);  
        //得到差值  
        $dayMin =$getDay- mktime(0, 0, 0, 1, 1, $year);  
        //换算出是第几周  
        $dayR =(int) ($dayMin / (7*24*3600));   
        return ++$dayR;  
}  
```
