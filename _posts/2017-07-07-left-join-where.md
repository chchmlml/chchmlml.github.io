---
layout: post
title: 'left join where'
date: '2017-07-07 13:37:21'
image: '/styles/images/'
description: '这是我的测试文章.'
tags:
- sql
- 数据库
categories:
- 编程技术
---


今天项目中遇到个问题，
有三个表需要联合查询，我起初用的是where条件，语句是
```sql

select c.ce_id,c.ce_name, p.pro_name, b.brand_name  
          from pps_ad_corporation_event c, pps_ad_brand b, pps_ad_profession p  
         where p.pro_id = c.pro_id  
           and b.brand_id = c.brand_id and c.ce_name like   
```

测试没什么问题，可是偶尔会差不到，经过测试，原来数据录入时，有的时候这几个表偶儿会无法关联，也就是id无法对应上，所以果断使用left join，开始的语句是这样写的
```sql

select c.ce_id, c.ce_name, p.pro_name, b.brand_name  
                  from pps_ad_corporation_event c   
                  left join pps_ad_brand b  
                    on b.brand_id = c.brand_id  
                  left join pps_ad_profession p  
                    on p.pro_id = c.pro_id where ce_name like '%%' and rownum < 5  

```

这样出现的问题主要like条件不能成立，还有ROWNUM<5条件不能成立，看来是sql语法有问题，查了下资料，更改成
```sql
select *  
          from (select c.ce_id, c.ce_name, p.pro_name, b.brand_name  
                  from pps_ad_corporation_event c   
                  left join pps_ad_brand b  
                    on b.brand_id = c.brand_id  
                  left join pps_ad_profession p  
                    on p.pro_id = c.pro_id  
                   )  
          where ce_name like '%运%' and ROWNUM <= 5  
          
```

虽然结果正确，但是大家可以看到，这样的效率不高，所以我有改进了一下
```sql
with c as (select * from pps_ad_corporation_event  where ce_name like '%运%' and rownum <= 5)     
       select * from c left join pps_ad_brand b  
          on b.brand_id = c.brand_id  
        left join pps_ad_profession p  
          on p.pro_id = c.pro_id  
```
        
