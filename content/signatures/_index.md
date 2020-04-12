---
title: "Understand Signatures"
pre: "<i class='fas fa-brain'></i> "
date: 2019-07-31T12:51:40+07:00
draft: false
---

![architecture-2](architecture/signature-In-depth.png?classes=border,shadow&width=30pc)

{{% notice warning %}}
Signature has many way allow **execute command** on your machine. So make sure you read the signature before you run it.
{{% /notice %}}

<h4 align="center">Each signature basically split in three parts and written in YAML format.</h4>

| Page                                           | Description                                      |
|------------------------------------------------|--------------------------------------------------|
| <h5>[Info](/signatures/#info)</h5>        | <h5>Information about the signature</h5>                   |
| <h5>[Variables & Payloads](/signatures/variables/)</h5>        | <h5>Various way to generate input for a request</h5>         |
| <h5>[Request builder Overview](/signatures/#request-builder-overview)</h5>        | <h5>Define various comoponent of the request that will send</h4>         |
| <h5>[Examples Signatures](https://github.com/jaeles-project/jaeles-signatures)</h5>        | <h5>Real Signature from base repository</h4>         |

***

### Info
Some information about the signature to index in the DB

```
# ID to index a signature
id: common-01-01
# Type of signature default is "single" and will auto change to "list" if it found variables key
type: list
# Filter signature by level or `-L` options, default level is 0
level: 1
# Some info about signature
info:
  name: PHP Debug bar
  # those feilds below are optional
  # default is "Info"
  risk: High
  tech: general
  os: general
```

***


### Request Builder Overview

* [**Conditions**](/signatures/conclusions-and-conditions/#conditions): If present, do some logical stuff to decide request will be send or not.
* [**Detection**](/signatures/detection/): Do some logical on based on detections script to determine request is vulnerable or not.
* [**Conclusions**](/signatures/conclusions-and-conditions/#conclusions): Do some task with result after request was sent.

* **Request component**: Define various component of the request that will be send to the target and detect if it vulnerable or not by analyze response.
  * [**Generator**](/signatures/generator/): Only available in fuzz signature. Provide some functions to generate request based on the template request with payloads.
  * [**Middleware**](/signatures/middleware/): Doing some extra task before sending a request to target.


![architecture-3](architecture/request-builder-in-depth.png?classes=border,shadow)

![architecture-2](request-builder/request-component-1.png?classes=border,shadow)
<h5 align="center">Example of request component</h5>

![architecture-2](request-builder/request-component-2.png?classes=border,shadow)
<h5 align="center">You can even use burp style as a request component</h5>



```
id: sensitive-secret-03
info:
  name: Common Secret file 03
  risk: Medium

# default root variable is `{{.BaseURL}}` or take affected from -p 'root=[[.BaseURL]]/blog/'
params:
  - root: '{{.BaseURL}}'

# get sample 404 request
origin:
  method: GET
  redirect: false
  headers:
    - User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:55.0) Gecko/20100101 Firefox/55
  url: >-
    {{.BaseURL}}/hopefully404.log

variables:
  - secret: |
      debug.log
      console.log
      laravel.log
      request.log
      access.log
      error.log
      envoy.log
      yarn-debug.log
      yarn-error.log
      php_errors.log
      yarn.lock
      nohup.out
requests:
  - method: GET
    redirect: false
    headers:
      - User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3984.0 Safari/537.36
    url: >-
      {{.root}}/{{.secret}}
    detections:
      # expected plain text content type
      - >-
        StatusCode() == 200 && (RegexSearch("resHeaders", ".*Content-Type:.*octet-stream") || RegexSearch("resHeaders", "text/plain")) && (Math.abs(ContentLength() - OriginContentLength()) > 2000)
      # or expected the content different than the original which is not found request
      - >-
        StatusCode() == 200 && !RegexSearch("response", "(?i)(Oops!|Whoops!|not\sfound|Request\sRejected|Access\sDenied|a\sbad\sURL|has\sbeen\slocked)") && (Math.abs(ContentLength() - OriginContentLength()) > 1000)
```

<h5 align="center">With Origin request to use Origin Detection API</h5>

***

### [Optional] Reference
This is just a reference info used to describe where the signature come out.

```
reference:
  # author of the CVE or peopel inspired you create this signature
  - credit: @example
  - link: https://jira.atlassian.com/browse/JRASERVER-70018
  - link2: https://example.com/xyz
  # author of this signature
  - author: @example
  - affected_version: 1.2 - 2 
  - verified: false 
```