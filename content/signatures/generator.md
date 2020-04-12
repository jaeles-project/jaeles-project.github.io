---
title: "Generator"
date: 2019-07-31T14:12:42+07:00
draft: false
weight: 3
---

This part will be executed before parsing request input with the signature for generate variation request base on the original request. Generator only available in `type: fuzz` signature.

## Generator

| API Generator         | Description           | Example  |
| :---------------------- |:--------------------| :------------------|
| **_Method_**      | Gen request based on method  | `Method("PUT")` , `Method()`  |
| **_Query_**      | Gen request based on Query String | `Query("[[.original]]{{.payload}}")`, `Query("[[.original]]{{.payload}}", "new")` |
| **_Path_**      | Gen request based on Path of URL | `Path("{{.payload}}", "ext")` |
| **_Body_**      | Gen request based on Request Body |  `Body("[[.original]]{{.payload}}")` |
| **_Header_**      | Gen request based on Request Header |  `Header("[[.original]]{{.payload}}", "X-Sample")` |
| **_Cookie_**      | Gen request based on Cookie Header |  `Cookie("{{.payload}}", "sample")`, `Cookie("[[.original]]{{.payload}}")` |

## Using Generator

```
id: sqli-01-01
info:
  name: SQL Injection Error based
  risk: Critical
type: fuzz

payloads:
  - '''"'
  - '`}'

requests:
  - generators:
      - Query("{{.payload}}")
    detections:
      - StringSearch("response", "mysql_fetch_array")
  - generators:
      - Query("[[.original]]{{.payload}}")
    detections:
      - StringSearch("response", "mysql_fetch_array")
```

{{% notice tip %}}
If you want to generate single request with many generator do like this `- Query("{{.payload}}"); Method("PUT")`.
{{% /notice %}}

### Method

`Method()` will generate `"GET", "POST", "PUT", "HEAD", "PATCH"` based on request input.
If parameter specified `Method("PUT")` only one request with **PUT** method generated.

*** 

### Query, Body and Header

`Query("[[.original]]{{.payload}}")` will generate number of based on number of query string in URL of the request input.

For example with signature [**sqli-01-01**](https://github.com/jaeles-project/jaeles-signatures/blob/master/fuzz/sql-error.yaml) and our URL is `http://example.com/?q=123`. We gonna get two new requests with URL `http://example.com/?q=123'"` and `http://example.com/?q=123%60}`.

If we use `Query("[[.original]]{{.payload}}","new")` generator then we gonna get `http://example.com/?q=123&new='"`.

`Header()` and `Body()` have same usage of `Query()` generator.

For example.
`Body("[[.original]]{{.payload}}")` generate number of based on number of request body parameter of the request input.

`Header("[[.original]] \ {{.payload}}", "X-Command")` will generate a new request with `X-Command` header with our payload.

***

### Path

First of all, **Jaeles** split path of URL like this

```
URL: http://example.com/rest/products/6/reviews.php?q=123
Path: => /rest/products/6/reviews
         0   1        2  3     -1
```

and have some special parameter `last`, `0/1/2` and `*`.

For example our URL is `http://example.com/a/b/reviews.php?q=123`.

| Path Generator |  Desc | E.g our payload is `.json`.               |
|:-------|:---------------|:--------------------------------------------------------|
| `Path("{{.payload}}", "last")`| Last position of the Path| `http://example.com/a/b/.json?q=123`                        |
| `Path("[[.original]]{{.payload}}", "last")`       | Last position of the Path| `http://example.com/a/b/reviews.php.json?q=123`            |
| `Path("{{.payload}}", "*")`       | Loop for all positions| `http://example.com/a.json/b/reviews?q=123` <br> `http://example.com/a/b.json/reviews?q=123` <br> `http://example.com/a/b/reviews.json?q=123` |


If you don't specified position parameter like this `Path("{{.payload}}")`, by default it's equal to `Path("{{.payload}}", "last")`.