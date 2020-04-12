---
title: "Example Signatures"
date: 2019-07-31T14:12:42+07:00
draft: false
# disableToc: true
---

Take a look at this [repo](https://github.com/jaeles-project/jaeles-signatures) repo for more examples.

- [**Single signature**](/signatures/examples#scan)
- [**List signature**](/signatures/examples#fuzz)
- [**Fuzz signature**](/signatures/examples#fuzz)

### Single signature
![single](signatures/single-1.png?classes=border,shadow)

Sending request to URLs with append `/_debugbar/open?max=20&offset=0` and look for `{"id":"` string in the reponse if it success.
***

### List signature
![list-1](signatures/list-1.png?classes=border,shadow)

Sending request to URLs with append `/{{.jira}}plugins/servlet/gadgets/makeRequest?url=https://127.0.0.1:443@{{.ssrf}}` with `{{.jira}} and {{.ssrf}}` get from variables.

![list-2](signatures/list-2.png?classes=border,shadow)

Simulate Directory Bruteforce with content from `/tmp/sensitive_paths.txt`. Confirm the path exist if **Secret** is in the reponse or `Not Found` word isn't in the repsonse and different lengoth of the request and original > 1000.

***

### Fuzz signature
![fuzz-1](signatures/fuzz-1.png?classes=border,shadow)
Repeat request recive from API and change replace the query value by the payload and look for error in the response.

![fuzz-2](signatures/fuzz-2.png?classes=border,shadow)
Repeat exactly request recive from API and change `Content-Type` of it and look for change in status code and response length to confirm that `Content-Type` can be used in application.