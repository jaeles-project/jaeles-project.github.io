---
title: "Architecture"
pre: "<i class='fas fa-atom'></i> "
date: 2019-07-31T14:12:42+07:00
draft: false
weight: 2
---

## Overview flow
![architecture-1](architecture/overview.png?classes=border,shadow)
<h5 align="center">Take list of Urls or raw request and combine with signature to generate request. Sending those requests and run detections script to determine request is vulnerable or not</h5>

***

## Request builder Flow

![architecture-2](architecture/request-builder-in-depth.png?classes=border,shadow)

- Get more input from [**variables**](/signatures/variables/).
- **[Only available in Fuzz Signature]** 
  - Run [**Generators**](/signatures/generator/) and Encoding part.
- Run [**Middleware**](/signatures/middleware/) part.
- Run [**Conclusion**](/signatures/conclusions-and-conditions/) part.
- Run [**Detection**](/signatures/detection/) part.