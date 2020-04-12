---
title: "Passive Detection"
draft: false
weight: 6
---


{{% notice note %}}
Enable passive detection via  `--passive` or `-G` option.
{{% /notice %}}

This part used to detection common pattern in the request and execute on every request after [**detection**](/signatures/detection/) part done.

Default passive signatures can be found [**here**](https://github.com/jaeles-project/jaeles-signatures/blob/master/passives/)

First time you run `jaeles`, it will installed passive to `~/.jaeles/passives`.

Add new passive signature as single file in `~/.jaeles/passives` folder or just add new rule to exist passive signature in **rules** section.

***

#### Sample passive signature

```
name: 'common pattern'
desc: 'grep for common interesting pattern'
rules:
  - id: directory-listing-01
    reason: 'Directory Listing'
    detections:
      - StringSearch("response", 'Index of /') && StringSearch("response", '>Last Modified<')

  - id: sensitive-pattern-01
    reason: 'PHP Info'
    detections:
      - StringSearch("response", 'PHP Configuration') && StringSearch("response", '<title>phpinfo()</title>')
```

#### Usage

**Jaeles** look for passive signature in file and rules in single signatures.
`id` and `reason` used for 
Usage of `detections` section is same from the [**detection**](/signatures/detection/).
