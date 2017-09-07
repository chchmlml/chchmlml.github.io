---
layout: post
title: '设计模式之策略模式'
date: '2017-07-07 13:37:21'
image: '/styles/images/'
description: '策略模式：定义算法组，分别封装，他们之间可以互换，此模式让算法的变化与客户的需求分开.'
tags:
- php
- 设计模式
categories:
- 编程技术
---

设计模式
====

策略模式：定义算法组，分别封装，他们之间可以互换，此模式让算法的变化与客户的需求分开。
举个例子，当我们需要一群鸭子，我们就定义这样一个类
```php
class duck{  
 function quack(){}//鸭子叫  
 function fly(){}//飞起来了  
}  
```


继承一下
====

当我们需要一个新的种类，继承就好了，但是问题是，有的鸭子不会飞，我们可以把叫跟飞的方法覆盖起来，但是工作量会很大，所以我们有用到接口了
```php
class duck{}  
  
interface quack{}  
interface fly{}  
```

问题
====
貌似这样就可以了，但是当需求又有变化时，再更改飞行，叫的接口时，很容易就会出问题了。
策略模式就可以派上用场了，我们把会变化的部分全部抽象出来，不在主体类中实现，也就是有一个抽象父类
```php
abstruct class duck{  
 quackBehivour = null;  
 flyBehivour = null;  
   
 function quack(){}  
 function fly(){}  
}  
```

接口来实现
====
上面的行为用来存储不同的鸭子不同的行为，所以这里还有两个类需要实现
```php
interface quackBehivour{  
 function quack(){}  
}  
interface flyBehivour{  
 function fly(){}  
}  
  
class mikeQuack implement quackBehivour{  
  
}  
class mikeFly implement flyBehivour{  
  
}  
```

所以这样我们就可以实现自己的mike鸭子了
```php
class mikeDuck extend duck{  
 function __construct(){  
   quackBehivour = new mikeQuack();  
   flyBehivour = new mikeFly();  
 }  
  
 function quack(){  
  quackBehivour.quack();  
 }  
  
 function fly(){  
  flyBehivour.fly();  
 }  
}  
```

总结
====
这样我们就把变化最多的两个部分飞行，叫这两个部分分离出来了，新的需求来时，我们只需要增加新的类就能完成扩展。
设计原则：
 针对接口而不是实现编程
 多组合，少继承
 
