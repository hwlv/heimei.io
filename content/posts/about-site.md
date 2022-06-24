
---
title: "博客搭建小记"
date: 2022-05-22T23:39:07+08:00
draft: true
categories: ["笔记"]
tags: ["nginx", "hugo", "博客" ]
---


### 博客搭建小记



### 域名

[heimei.io](https://heimei.io) 因为io域名在it行业比较火，就在godaddy上找了这个域名，国内暂时没找到备案io域名的方法。 heimei 黑莓的意思。

### 主机

淘宝买的香港主机，免备案。



### 博客

用的Hugo，代码开源在这里https://github.com/hwlv/heimei.io



### 反向代理及 HTTPS

服务器Nginx

```ini
server {
        listen       80 default_server;
        listen       [::]:80 default_server;
        server_name  heimei.io;
        root         /usr/share/nginx/html;
        rewrite ^(.*) https://heimei.io$1 permanent;
}
# rewrite http跳转https
```

https证书用 Let’s Encrypt ，可以永远使用

### 评论系统

用的是https://utteranc.es/。主要特点就是基于 GitHub Issue 作评论系统。博客代码是开源的，评论放在issue里再好不过了。



### 其他

1. 用

