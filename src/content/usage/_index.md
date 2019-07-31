---
title: "Usage"
date: 2019-07-31T13:44:32+07:00
draft: false
weight: 3
---


### Using with Burp Suite

Go to Burp Extender Tab and add python extension from `Jaeles/plugins/Jaeles-burp.py` to your Burp.

Get your JWT from this [API](https://documenter.getpostman.com/view/7482578/SVSLrUeJ?version=latest#1c59bfca-f678-49d9-a30b-8b0b80b0a289) and fill it into Jaeles Tab in Burp then you're good to go.

***

### Import Request with proxy mode

Navigate to `Jaeles/jaeles/extensions` then run

```
mitmdump -q -p 8779 -s jaeles-mitmproxy.py
```

Import request from command line

```
curl "http://example.com/listproducts.php?cat=1" --proxy http://<your_bind_interface>:8779  -H 'X-Jaeles: <your_token>'
```

or just run this if you bind from localhost

```
curl "http://example.com/listproducts.php?cat=1" --proxy http://127.0.0.1:8779
```
