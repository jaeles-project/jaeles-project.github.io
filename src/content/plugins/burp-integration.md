---
title: "Burp Integration"
date: 2019-07-31T13:01:12+07:00
weight: 1
draft: false
---

![Burp-Extensions](screenshots/ext-0.png?classes=border,shadow)
<h4 align="center">Get input from Burp</h4>

Burp -> Extender -> Add `Jaeles-burp.py` as python extensions.

***

![Burp-Extensions](screenshots/burp-ext.png?classes=border,shadow)

Get your JWT from this [API](https://documenter.getpostman.com/view/7482578/SVSLrUeJ?version=latest#1c59bfca-f678-49d9-a30b-8b0b80b0a289) and fill it into Jaeles Tab in Burp then you're good to go.
Click save button if you want to store JWT persistence.

{{% notice note %}}
Default log will be store in **`~/.jaeles-burp/config.json`**
{{% /notice %}}