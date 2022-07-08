
---
title: "博客搭建小记"
date: 2022-06-22T23:39:07+08:00
draft: true
categories: ["笔记"]
tags: ["nginx", "hugo", "博客" ]
---

### 域名

[heimei.io](https://heimei.io) 因为最近io域名比较火，就在godaddy上找了这个域名，国内暂时没找到备案io域名的方法。 heimei 黑莓的意思。

### 主机

香港主机，免备案。

### 博客源码

用的Hugo，代码仓库在[这里](https://github.com/hwlv/heimei.io)

### 部署

用github actions。yml文件在[这里](https://github.com/hwlv/heimei.io/blob/main/.github/workflows/main.yml)
每次本地完成后直接运行./publish.sh脚本，github会自动通过ci进行部署

### 统计
用的开源工具: [https://github.com/plausible/analytics](https://github.com/plausible/analytics)。官网 [plausible.io](https://plausible.io/) 可以免费体验一个月
### Nginx配置

gzip和https

```ini
gzip on;
gzip_comp_level 5;
gzip_min_length 1k;
gzip_buffers 4 16k;
gzip_proxied any;
gzip_vary on;
gzip_types
application/javascript
application/x-javascript
text/javascript
text/css
text/xml
application/xhtml+xml
application/xml
application/atom+xml
application/rdf+xml
application/rss+xml
application/geo+json
application/json
application/ld+json
application/manifest+json
application/x-web-app-manifest+json
image/svg+xml
text/x-cross-domain-policy;
gzip_static on;  
gzip_disable "MSIE [1-6]\.";

server {
        listen       80 default_server;
        listen       [::]:80 default_server;
        server_name  heimei.io;
        root         /usr/share/nginx/html;
        rewrite ^(.*) https://heimei.io$1 permanent;
}
# rewrite http跳转https
```

https证书用 Let’s Encrypt ，可以永久使用。

### 评论系统

用的是https://utteranc.es/。主要特点就是基于 GitHub Issue 作评论系统。博客代码是开源的，评论放在issue里正合适。



