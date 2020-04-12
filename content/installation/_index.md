---
title: "Installation"
pre: "<i class='fas fa-feather'></i> "
date: 2019-07-31T13:17:33+07:00
weight: 2
draft: false
---

## Jaeles installation

Download [precompiled version here](https://github.com/jaeles-project/jaeles/releases).

If you have a Go environment, make sure you have **Go >= 1.13** with Go Modules enable and run the following command.

```shell
GO111MODULE=on go get github.com/jaeles-project/jaeles
```

***

## Initialize Signature and Web UI

This gonna pull latest signature and UI build from default repo.

```
jaeles config -a update --repo http://github.com/jaeles-project/jaeles-signatures
```

***

## Load new signature to Database

Try to clone signatures folder to somewhere like this

```
git clone --depth=1 https://github.com/jaeles-project/jaeles-signatures /tmp/jaeles-signatures/

```

then reload them in the DB with this command.

```
jaeles config -a reload --signDir /tmp/custom-signatures/
```

with `/tmp/custom-signatures/` is your custom signature folder.

Or you can just use new signature directly by using this command

```
jaeles scan -s new_sign.yaml -u example.com
```