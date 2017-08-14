---
layout: post
title: 'json string to json'
date: '2017-07-07 13:37:21'
image: '/styles/images/'
description: '这是我的测试文章.'
tags:
- javascript
categories:
- 编程技术
---

* content
{:toc}


jQuery的ajax返回的如果是json格式，在success方法获取的值并不能直接当做json object处理，需要用$.parseJSON来转化成个json对象
例如
后台程序
```php
<?php  
include ("json_helper.php");  
$Josn = new Services_JSON ();  
$r = Array ("status"=>1,"list"=> array(  
        Array ("c_id" => 1, "c_parent_id" => 0, "c_name" => "旅游美食", "c_status" => 0, "c_type" => 0, "c_area" => "反选:福建|湖南|内蒙古|" ),  
        Array ("c_id" => 2, "c_parent_id" => 0, "c_name" => "旅游美食", "c_status" => 0, "c_type" => 0, "c_area" => "反选:福建|湖南|内蒙古|" ),  
        Array ("c_id" => 3, "c_parent_id" => 0, "c_name" => "旅游美食", "c_status" => 0, "c_type" => 0, "c_area" => "反选:福建|湖南|内蒙古|" ),  
        Array ("c_id" => 4, "c_parent_id" => 0, "c_name" => "旅游美食", "c_status" => 0, "c_type" => 0, "c_area" => "反选:福建|湖南|内蒙古|" ),  
    )  
);  
$r_josn = $Josn->encode($r);   
echo $r_josn;   
```

静态页面
```html
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<title>Insert title here</title>  
<script type="text/javascript" src="/js/jquery-1.4.2.min.js"></script>  
<script type="text/javascript">  
$(function(){   
    $("#getjson").bind("click",function(){  
        $.ajax({  
              type: "POST",  
               url: "/json/index.php",  
               success: function(msg){   
                   var r = $.parseJSON(msg);   
                   var tb = $("<table border=1></table>");  
                   for(i=0;i<r.list.length;i++){  
                       tb.append("<tr><td>"+r.list[i].c_id+"</td><td>"+r.list[i].c_name+"</td></tr>");  
                   }  
                   $("body").append(tb);  
               }  
  
        });  
    });  
})  
</script>  
</head>  
<body>  
<button id="getjson">获取</button>  
</body>  
</html>  

```
