---
title: "Variables"
date: 2019-07-31T14:12:42+07:00
draft: false
weight: 1
---

This part will be executed first to generate for your signature list of input.

### Default variables generated from input

| Default variable | E.g: `http://example.com:8080/a/b/c.php?q=123`               |
|:-----------------|:--------------------------------------------------------|
| `{{.URL}}`       | `http://example.com:8080/a/b/c?q=123`                        |
| `{{.BaseURL}}`   | `http://example.com:8080`                                    |
| `{{.Host}}`      | `example.com:8080`                                           |
| `{{.Domain}}`      | `example.com`                                           |
| `{{.Port}}`      | `8080`                                           |
| `{{.Path}}`      | `/a/b/c`                                                |
| `{{.Extension}}` | `.php`                                                  |
| `{{.Raw}}`       | `http://example.com/a/b/c.php?q=123`                    |
| `{{.bar}}`       | take from `--params 'bar=111'` or `-p 'bar=111`   |
| `{{.Resources}}`       | Resources path `~/.jaeles/resources`    |
| `{{.ThirdParty}}`       | Third party path `~/.jaeles/thirdparty`    |

***

### List of avaliable Variables function

| API Variables         | Description           | Example  |
| :---------------------- |:--------------------| :------------------|
| **_File_**      | return string as content of file and split it by new line | `File("/tmp/sensitvie_paths.txt")` |
| **_Base64EncodeByLines_**      | Like **_Base64Encode_** but split input as a new line first | `Base64EncodeByLines("samp\ndummy")` |
| **_Base64Encode_**      | return base64 encoded string| `Base64Encode("a")` will return string like this: `YQo=` |
| **_InputCmd_**      | return string as output of os command | `InputCmd("echo 123")` |
| **_RandomNumber_**      | return random number with length | `RandomNumber(4)` will return string like this: `6523` |
| **_RandomString_**      | return random string with length | `RandomString(6)` will return string like this: `zkdlsa` |
| **_Range_**      | return random string with length | `Range(1,6)` will return list of strings like this 1 to 5` |
| **_URLEncodeByLines_**      | Like **_URLEncode_** but split input as a new line first | `URLEncodeByLines("samp le\ndummy")` |
| **_URLEncode_**      | return url encoded string | `URLEncode("samp le")` will return string like this: `sample%20le` |


### Example of using variables func
```
id: xss-param-fuzz-02
type: fuzz
level: 1
info:
  name: XSS Fuzz on Param Basic 02
  risk: Medium

params:
  - rand6: RandomString(6)

# read content of `~/.jaeles/resources/lite-params.txt` and return as a list
variables:
  - name: File("{{.Resources}}/lite-params.txt")

payloads:
  - >-
    '><h1>{{.rand6}}
  - >-
    ><h1>{{.rand6}}
  - >-
    \"><h1>{{.rand6}}
  - >-
    `><h1>{{.rand6}}

requests:
  - generators:
      - Query("{{.payload}}", "{{.name}}")
    detections:
      - >-
        StringSearch("resHeaders", "text/html") && StringSearch("response", "{{.payload}}") && (StatusCode() < 400 && StatusCode() >= 300)
```