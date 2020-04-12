---
title: "Middleware"
date: 2019-07-31T14:12:42+07:00
draft: false
weight: 5
---

This part will be executed right before request send to the target for doing some extra task before sending a request to target.

| API Detection         | Description           | Example  |
| :---------------------- |:--------------------| :------------------|
| **_InvokeCmd_**      | Execute Command line and get result of it | `InvokeCmd("phuip-fpizdam {{.URL}}")` |
| **_Host2IP_**      | Turn `Host: domain.com` header to `Host: IP address` |  `Host2IP()` |
