---
layout: post
title: 'win7 oracle php'
date: '2017-07-07 13:37:21'
image: '/styles/images/'
description: '这是我的测试文章.'
categories:
- 技术
---


今天自己的电脑突然很卡，一上午竟然死机了四次，没办法就准备升级到win7。
    升级之后最麻烦的来了，就是要搭建我的工作环境。我的工作环境是本地php5+局域网内的oracle客户端访问。因为之前有xp的搭建经验，所以这次不是很棘手。
    先下载个xampp1.7.5（之前在xp上也是这个，所以就继续），安装，一切顺利，打开phpinfo()，没有oci8的提示，所以，进入php目录。打开php.ini，吧extension=php_oci8.dll，extension=php_pdo_oci.dll前面的；去掉，重启apache，打开phpinfo()，仍然没有oci8的提示，这里有个小问题，就是在php的扩展库里没有对oracle的扩展支持，所以大家还有下oraociei10.dll 和orannzsbb10.dll 和oci.dll（大家可以在这里下载），放入php环境下的ext（这个要在环境变里面，否则就复制到system32下面），重启apache，打开phpinfo()，已经有了oci8的提示。
    下面配置oci客户端（这里大家注意下，因为php5以后，默认只支持10g以上版本），因为我这里要与公司的局域网服务端连接，只需要plsql调试，也就是客户端的安装就好了（http://115.com/file/dng7y94w），安装过程是从网上找的：
1. 把下载的Basic版压缩包解压，放到 D:\Program Files\instantclient_10_2 目录下，总共8个文件。
2. 桌面上，右键点“我的电脑”，选择“属性”，选择“高级”页中的“环境变量”，在系统变量中，增加：
   1) 变量名：ORACLE_HOME
      变量值：D:\Program Files\instantclient_10_2
   2) 变量名：TNS_ADMIN
      变量值：D:\Program Files\instantclient_10_2
   3) 变量名：NLS_LANG
      变量值：SIMPLIFIED CHINESE_CHINA.ZHS16GBK
   4) 修改Path变量，在后面添加 D:\Program Files\instantclient_10_2
   如果不愿意手工增加，可以下载 SetOraEnv.rar 附件, 解压后执行其中的 setOraEnv.bat.
3. 在D:\Progra~1\instantclient_10_2 新建一个文本文件，文件名为tnsnames.ora,文件中增加自己的数据库别名配置，
示例如下：
   MyDB =
(DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = 172.16.1.16)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = ora10g)
    )
)
主要改=前面的别名，Host为IP地址, SERVICE_NAME为数据库服务器的实例名。
4. 把sqlplus的压缩包中的文件，解压到 D:\Program Files\instantclient_10_2 目录下,共3个文件。
   在Dos命令行，在D:\Program Files\instantclient_10_2 目录下，运行 sqlplus   username/password@dbname,即可连到数据库上。
（我没有进行第四步），个人认为环境变量最重要的是path、TNS_ADMIN的修改，重启apache，一切OK。
