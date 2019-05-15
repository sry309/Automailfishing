# Automailfishing

Automatic Mail Fishing、批量邮件钓鱼

根据姓名top500生成收件人，smtp批量发信

Usage:

1、制作钓鱼office文档

1、需要一个可用于smtp发信的邮箱，打开批处理文件，配置发信邮箱和密码、钓鱼附件放置于data目录下，并在Automailfishing.bat中配置正确路径和文件名。

2、生成目标域名姓名top500邮箱，生成的文件在data目录下

Automailfishing.bat makemail baidu.com

3、将生成的邮箱放入data目录下recvlist.txt接收列表

4、配置好后，运行 Automailfishing.bat开始批量发信

可选参数

Automailfishing.bat text   //发送text文本的内容，data目录下mailtext.txt

Automailfishing.bat html   //发送html格式的内容，放置于data目录下mailhtml.html

Automailfishing.bat makemail baidu.com  //生成目域名姓名top500邮箱


此版本为18年临时任务创建，近期我会更新更加便捷自动化的版本
