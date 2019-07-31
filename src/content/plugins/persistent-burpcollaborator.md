---
title: "Persistent Burpcollaborator"
date: 2019-07-31T13:02:57+07:00
draft: false
---

### Get Collaborator Secret token 
![Architecture](screenshots/burp-collab-config.png?classes=border,shadow)
<h4 align="center">Route traffic through proxy</h4>

Burp -> Project Options -> Connections -> Upstream Proxy Server -> then run command below

```
mitmdump -q -p 8667 -s burpcollaborator-oob.py
```

***

![Architecture](screenshots/collab-polling.png?classes=border,shadow)
<h4 align="center">Get burpcollaborator secret</h4>

Burp -> Project Options -> Connections -> Mics -> -> Burp Collaborator Server.

Check on Poll over unencrypted HTTP and press run health check many time you want to get secret key

{{% notice note %}}
Default log will be store in **./collaborator.json**
{{% /notice %}}
