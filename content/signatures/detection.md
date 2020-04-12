---
title: "Detection"
date: 2019-07-31T14:12:42+07:00
draft: false
weight: 2
---

This part will be executed right after Jaeles got response from the request and do a logic for determine the request is vulnerable or not.

Detections was written in **Javascript** so you can write whatever you want with some predefined function below  as long as you return **boolean** value to determine it's found something or not.

### Examples Detection

```
# Response Status code equal 200 and the response body contain a string 'google.com' or 'example.com'
StatusCode() == 200 && (StringSearch("response", "google.com") || StringSearch("response", "example.com"))

# Content Length of the response have to greater than original request
ContentLength() - OriginContentLength() > 5000

# Response time of the request greater or smaller than original response time
Math.abs(ResponseTime() - OriginResponseTime()) > 3

# Get value of previous request
ContentLength() - parseInt(ValueOf("404html")) > 1000
OriginResponseTime() - parseFloat(ValueOf("resTime")) > 5

# Expected different response
StatusCode() == 200 && !RegexSearch("response", "(?i)(Oops!|Whoops!|not\sfound|Request\sRejected|Access\sDenied|a\sbad\sURL|has\sbeen\slocked)") && (Math.abs(ContentLength() - OriginContentLength()) > 1000)

# Do passive scan if previous detection satisfied
StatusCode() == 200 && StringSearch("response", "jcr:title") && StringSearch("response", "sling:resourceType") && DoPassive()
```

### Normal Detection

| API Detection         | Description           | Example  |
| :---------------------- |:--------------------| :------------------|
| **_StringSearch_**      | Search string in component | `StringSearch("response", "something")` |
| **_StringCount_**      | Return number of string in component | `StringCount("response", "something")` |
| **_RegexSearch_**      | Search regex in component |  `RegexSearch("response", ".*something$")` |
| **_RegexCount_**      | Return number of string match the regex in component |  `RegexCount("response", ".*something$")` |
| **_StatusCode_**      | Status code of the response |  `StatusCode() == 200`, `StatusCode() > 400` |
| **_ResponseTime_**      | Response time of the response (second) |  `ResponseTime() > 3` |
| **_ContentLength_**      | Content Length of response |  `ContentLength() > 5000`, `StatusCode() > 400` |
| **_OriginStatusCode_**      | Status code of the Original response |  `OriginStatusCode() != StatusCode()` |
| **_OriginResponseTime_**      | Response time of the Original response (second) |  `ResponseTime() > OriginResponseTime()` |
| **_OriginContentLength_**      | Content Length of Original response |  `ContentLength() - OriginContentLength() > 5000` |
| **_ValueOf_**      | Value of variables |  `ValueOf("foo") == "bar"` |
| **_HasPopUp_**      | Check if is there any pop-up box while requesting to a URL (only available when using `engine: chrome`) |  `StatusCode() == 200 && HasPopUp()` |
| **_Exist_**      | Check if is file or folder exist |  `Exist('/tmp/folder/newfile')` |
| **_StringGrepCmd_**      | Search string in custom command output |  `StringGrepCmd('bash command', 'string_to_grep')` |
| **_RegexGrepCmd_**      | Search regex in custom command output |  `RegexGrepCmd('bash command', 'regex_to_grep')` |

### Selector for search

| API Detection         | Description           | Example  |
| :---------------------- |:--------------------| :------------------|
| **request**      | raw request   |  `StringSearch("request", "something")` |
| **response**      | raw response of the request  |  `StringSearch("oResponse", "something")` |
| **resHeaders**      | raw headers of the response  |  `StringSearch("resHeaders", "something")` |
| **resBody**      | raw body of the response  |  `StringSearch("resBody", "something")` |
| **oRequest**      | raw original request   |  `StringSearch("oRequest", "something")` |
| **oResponse**      | raw original request response of the request  |  `StringSearch("response", "something")` |
| **middleware**      | output of the middleware  |  `StringSearch("middleware", "Success!")` |

### Special Detection

| API Detection         | Description           | Example  |
| :---------------------- |:--------------------| :------------------|
| **Collab**      | Grepping collaborator response in Reuqest response or <br> Do Real Polling with BurpCollab secret.  |  `Collab("{{.oob}}")` |
| **DoPassive**      | Do passive scan for this request if it satisfied the detection  |  `DoPassive(")` |