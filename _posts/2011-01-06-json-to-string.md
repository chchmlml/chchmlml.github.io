---
layout: post
title: ' JS json object 与 string 相互转换'
date: '2017-07-06 03:21:35'
image: '/styles/images/'
description: '一篇javascript小技巧.'
tags:
- javascript
categories:
- 前端技术
---

这是很久之前从文章了，收录下

```javascript
//object t ostr
function obj2str(o){
   var r = [];
   if(typeof o == "string" || o == null) {
     return o;
   }
   if(typeof o == "object"){
     if(!o.sort){
       r[0]="{"
       for(var i in o){
         r[r.length]=i;
         r[r.length]=":";
         r[r.length]=obj2str(o[i]);
         r[r.length]=",";
       }
       r[r.length-1]="}"
     }else{
       r[0]="["
       for(var i =0;i<o.length;i++){
         r[r.length]=obj2str(o[i]);
         r[r.length]=",";
       }
       r[r.length-1]="]"
     }
     return r.join("");
   }
   return o.toString();
}

//string 转 object
function taoRan(){
var str='{"result": [["提现", "219"], ["提现银行", "121"], ["退款", "272"], ["提现失败", "16"], ["团购", "15"], ["淘宝", "412"],["台湾", "58"], ["提现限额", "16"], ["提现时间", "81"], ["台湾认证", "26"]]}';
alert(strToObj(str).result[2]);
}
function strToObj(json){ 
         return eval("("+json+")"); 
}
```

[jekyll-gh]: https://github.com/mojombo/jekyll
[jekyll]:    http://jekyllrb.com
