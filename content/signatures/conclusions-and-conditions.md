---
title: "Conclusions & Conditions"
draft: false
weight: 7
---

### Sample signature used conclusions and conditions

```
id: fuzz-01-02
info:
  name: Fuzz Injection

variables:
  - xss: |
      sam
      foo

requests:
  - method: GET
    values:
      - custom: "z1123zzz"
    url: >-
      {{.BaseURL}}/tests/sinks.html?name=[[.custom]]{{.xss}}
    detections:
      - StringSearch("response", "mysql_fetch_array")
    conclusions:
      - SetValue("code", StatusCode())
      - SetValue("rt", ResponseTime())

  - conditions:
      - ValueOf("code") == "200"
      - parseInt(ValueOf("code")) > 200
      - parseFloat(ValueOf("rt")) > 1
    method: GET
    url: >-
      {{.BaseURL}}/tests/sinks.html?name=2222222222222
    detections:
      - StringSearch("response", "mysql_fetch_array")

```
***

### Conditions

If present, this part will be run before continue to generate request. Just some logic to check to prevent sending too much false positive request.

Usage of `conditions` section is same from the [**detection**](/signatures/detection/).

### Conclusions

{{% notice note %}}
Note that value from **fonclusions** is always return string. Make sure you convert it to `Int` or `Float` before compare.
{{% /notice %}}

Set some extra value based on the request for later use before we run detection part.

| Property   | Description    | Example                                      |
|------------|:---------------|:---------------------------------------------------|
| **SetValue** | assign something to a variable | `SetValue("value_name", StatusCode())` |
| **StringSelect** | Select a string from component | `StringSelect("component", "res1", "right", "left")` |
| **RegexSelect** | Select a string from component by regex | `RegexSelect("component", "var_name", "regex")` or `RegexSelect("component", "var_name", "regex", "position")` |

Please refer to [**detection**](/signatures/detection/) for some similar usage.
