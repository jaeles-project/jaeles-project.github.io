---
title: "Burp Integration"
date: 2019-07-31T13:01:12+07:00
weight: 1
draft: false
---

Plugin can be found [here](https://github.com/jaeles-project/jaeles-plugins/blob/master/jaeles-burp.py) and Video Guide [here](https://youtu.be/1lxsYhfTq3M)

![Burp Integration](https://github.com/jaeles-project/jaeles-plugins/blob/master/imgs/Burp-Integration.gif?raw=true)


### How to install Burp plugin

Download the plugin on from this [URL](https://github.com/jaeles-project/jaeles-plugins/blob/master/jaeles-burp.py).

Run **Jaeles** as server mode by using this command `jaeles server -v`. First time you run jaeles server, it's gonna create default credentials on `~/.jaeles/burp.json`. (Delete `~/.jaeles/` folder and run it again if you have any issue)

Make sure you have **Jython** installed on Burp then load it.
Burp -> Extender -> Add `jaeles-burp.py` as python extensions.


![Burp-Extensions](screenshots/burp-ext.png?classes=border,shadow)

When Plugin is loaded it gonna auto do login and store persistence JWT in `~/.jaeles/burp.json`. Otherswise you only need to click reload then press **Test Connection** again to make sure you're ready to send.

***

![Burp-Extensions](screenshots/ext-0.png?classes=border,shadow)
<h4 align="center">Get input from Burp</h4>


### How to get JWT

![API](screenshots/first-time.png?classes=border,shadow)
First time you run Jaeles, it'll setup some config and credentials at `~/.jaeles/config.yaml`


```
POST /auth/login HTTP/1.1
Content-Type: application/json
User-Agent: Jaeles Scanner
Host: 127.0.0.1:5000
Content-Length: 54
Connection: close

{
    "username": "jaeles",
    "password": "your_password_here"
}
```

Use that credentials to get your JWT.

![Burp-Extensions](screenshots/auth-req.png?classes=border,shadow)
