---
title: "Request Properties"
date: 2019-07-31T14:12:42+07:00
draft: false
weight: 1
---

Some core properties for draft a request.

### Properties for building a request

| Property      | Description                          | Default Value                            |
|---------------|:-------------------------------------|:-----------------------------------------|
| **method**    | Request Method           | This field is required in single or list signature |
| **url**       | URL for sending request  | This field is required in single or list signature |
| **headers**   | Headers of the request | default is **blank** |
| **body**      | Body of the request | default is **blank** |
| **engine**    | Client to send a request | default is **blank**. Use `engine: chrome` for sending with real browser |
| **timeout**   | HTTP Timeout for request (this will override `--timeout` option) | value of `--timeout` option |
| **repeat**    | Repeat the request | `repeat: 0`  |
| **values**    | Another place to put variables but will replace with `[[.variable_name]]` format. | default is **blank** |

### Some Examples in real signatures

#### Elastic Search Misconfigure

```
# info to search signature
id: elasctic-misconfigure-01
info:
  name: Elasctic Search Misconfiguration
  risk: Medium

requests:
  - method: GET
    url: {{.BaseURL}}
    headers:
      - User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:55.0) Gecko/20100101 Firefox/55
    detections:
      - StatusCode() == 200 && StringSearch("response", '"cluster_name"') && StringSearch("resHeaders", "Content-Type: application/json")

  - method: GET
    url: {{.BaseURL}}/_search
    headers:
      - User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:55.0) Gecko/20100101 Firefox/55
    detections:
      - StatusCode() == 200 && StringSearch("response", 'took') && StringSearch("resHeaders", "Content-Type: application/json")
```

#### With real browser

```
# info to search signature
id: dom-xss-01
info:
  name: DOM XSS test
  risk: High

# tested on https://brutelogic.com.br/tests/sinks.html?name=hello

variables:
  - xss: |
      sam
      %3Cimg+src+onerror=alert(1)%3E

requests:
  - method: GET
    engine: chrome
    timeout: 10
    url: {{.BaseURL}}/tests/sinks.html?name={{.xss}}
    detections:
      - StatusCode() == 200 && HasPopUp()
```