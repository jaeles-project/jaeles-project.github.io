---
title: "Usage"
pre: "<i class='fas fa-snowflake'></i> "
date: 2019-07-31T13:44:32+07:00
draft: false
weight: 3
---

### Examples Command

```bash


                                                ,+izzir,
                                              '*K@@Q8&Q@@8t'
                                            !Q@N;'',~~;\D@@t'
                                            ,Q@q. '~~~~~~;5@@L
                                            L@@+  '~~~~~~~^Q@X
                                            ^@@z  '~~~~~~~|Q@y
                                            'Z@@7  '~~~~;TQ@N,
                                              ^%@QhJ7fmDQ@Q7'     ~}DQ@@@Qqv,
                                                ~jdQ@@Qdjr'     ,U@@qv=|tm#@QY
                                                  *@@=         D@&;  ,~~~;f@@^
                                                  <@@+        .@@L  '~~~~~~K@P
                                                ,<zb@@K7<~'    'Q@f  '_~~~~!N@j
                                            !XQ@QA5jEbWQ@@Ri.'*Q@@D+'',;=jQ@#.
                                          _d@@a!  ';^rr=7kQ@QQ@RzoQ@@Q#Q@@Nz.
                                          ;Q@D_  '~^^r^^rr^|K@@K   ';*\vi=_'
                                        '8@%'   ~^^r^r^^^r^=A@@'
                ,<}kKKhI='               =@@*  ^qfr^rrrrj8U<^iQ@*
              !b@@NXaURQ@@U;         ''~+P@@L  z@Qv^^^rrz6y=r7@@=
            'y@@a~ ',~~;LD@@7  '^^' \Q@@@Q@@W' 'y@@RXXDdT^^r=b@@'
            T@@i  ',~~~~~;E@@= ,D%~ '<^~''~Q@%~  =ENQQNKi^rLD@@7
            X@#'  '~~~~~~~<Q@o             ,6@@X+' ,!+^+<J6Q@&+
            n@@^   ,~~~~~~f@@i               '7R@@QgDWQQ@@@Q<
            'b@Qi' ',~~~^S@@m'                  '^iYjjxi^=Q@%,
            '7Q@QEzLYmDQ@BL'                             :8@#~
              '+yb#QQNKf^'                                ,R@Q; '''
                                                            'b@@#Q@@QDj^'
                                                          ,X@@K?!=|7mQ@Q}'
                                                          ,N@W; '~~~~~;IQ@q'
                                                          }@Q~  ,~~~~~~~f@@=
                                                          E@Q'  ~~~~~~~~7@@L
                                                          +@@}' ,~~~~~~^%@Q_
                                                          ^Q@Qz,,~;^\UQ@D_
                                                            .iD@@QQQ@@QU='
                                                              '^|iL>~'


                            🚀 Jaeles beta v0.7.2 by @j3ssiejjj 🚀

                    The Swiss Army knife for automated Web Application Testing

                                          ¯\_(ツ)_/¯

    Usage:
    jaeles scan|server|config [options]
    jaeles scan|server|config -h -- Show usage message

    Subcommands:
      jaeles scan   --  Scan list of URLs based on selected signatures
      jaeles server --  Start API server
      jaeles config --  Configuration CLI 

    Core Flags:
      -c, --concurrency int         Set the concurrency level (default 20)
      -o, --output string           output folder name (default "out")
      -s, --signs strings           Signature selector (Multiple -s flags are accepted)
      -x, --exclude strings         Exclude Signature selector (Multiple -x flags are accepted)
      -L, --level int               Filter signatures by level (default 1)
      -G, --passive                 Turn on passive detections
      -p, --params strings          Custom params -p='foo=bar' (Multiple -p flags are accepted)

    Mics Flags:
          --proxy string            proxy
          --timeout int             HTTP timeout (default 20)
          --debug                   Debug
      -v, --verbose                 Verbose
      -f, --found string            Run host OS command when vulnerable found
      -O, --summaryOutput string    Summary output file
          --passiveOutput string    Passive output folder (default is passive-out)
          --passiveSummary string   Passive Summary file
      -S, --selectorFile string     Signature selector from file
          --sp string               Selector for passive detections (default "*")


    Usage scan Commands:
      jaeles scan -s <signature> -u <url>
      jaeles scan -c 50 -s <signature> -U <list_urls> -L <level-of-signatures>
      jaeles scan -c 50 -s <signature> -U <list_urls>
      jaeles scan -c 50 -s <signature> -U <list_urls> -p 'dest=xxx.burpcollaborator.net'
      jaeles scan -c 50 -s <signature> -U <list_urls> -f 'noti_slack "{{.vulnInfo}}"'
      jaeles scan -v -c 50 -s <signature> -U list_target.txt -o /tmp/output
      jaeles scan -s <signature> -s <another-selector> -u http://example.com
      jaeles scan -G -s <signature> -s <another-selector> -x <exclude-selector> -u http://example.com
      cat list_target.txt | jaeles scan -c 100 -s <signature>


    Examples Commands:
      jaeles scan -s 'jira' -s 'ruby' -u target.com
      jaeles scan -c 50 -s 'java' -x 'tomcat' -U list_of_urls.txt
      jaeles scan -G -c 50 -s '/tmp/custom-signature/.*' -U list_of_urls.txt
      jaeles scan -v -s '~/my-signatures/products/wordpress/.*' -u 'https://wp.example.com' -p 'root=[[.URL]]'
      cat urls.txt | grep 'interesting' | jaeles scan -L 5 -c 50 -s 'fuzz/.*' -U list_of_urls.txt --proxy http://127.0.0.1:8080


    Others Commands:
      jaeles server -s '/tmp/custom-signature/sensitive/.*' -L 2
      jaeles config -a reload --signDir /tmp/signatures-folder/
      jaeles config -a update --repo https://github.com/jaeles-project/jaeles-signatures

```

***

## Fuzz
```bash
Start API Server

Usage:
  jaeles server [flags]

Flags:
  -h, --help          help for server
      --host string   IP address to bind the server (default "127.0.0.1")
      --port string   Port (default "5000")
```

### Burp Integration

![Burp Integration](https://github.com/jaeles-project/jaeles-plugins/blob/master/imgs/Burp-Integration.gif?raw=true)


<h5 align="center">Plugin can be found <a href="https://github.com/jaeles-project/jaeles-plugins/blob/master/jaeles-burp.py">here</a> and Video Guide <a href="https://youtu.be/1lxsYhfTq3M">here</a></h5>


***

## Full Usage

```bash
Usage:
  jaeles [command]

Available Commands:
  config      Configuration CLI
  help        Help about any command
  scan        Scan list of URLs based on selected signatures
  server      Start API server

Flags:
  -c, --concurrency int         Set the concurrency level (default 20)
      --config string           config file (default is $HOME/.jaeles/config.yaml)
      --debug                   Debug
      --delay int               Milliseconds delay for polling new job (default 100)
  -x, --exclude strings         Exclude Signature selector (Multiple -x flags are accepted)
  -f, --found string            Run host OS command when vulnerable found
  -h, --help                    help for jaeles
  -L, --level int               Filter signature by level (default 1)
  -l, --log string              log file
      --no-background           Do not run background task
      --no-output               Do not store raw output
  -o, --output string           output folder name (default "out")
  -p, --params strings          Custom params -p='foo=bar' (Multiple -p flags are accepted)
  -G, --passive                 Turn on passive detections
      --passiveOutput string    Passive output folder (default is passive-out)
      --passiveSummary string   Passive Summary file
      --proxy string            proxy
      --refresh int             Refresh (default 10)
      --retry int               retry
      --rootDir string          root Project (default "~/.jaeles/")
      --save-raw                save raw request
      --scanID string           Scan ID
  -S, --selectorFile string     Signature selector from file
      --signDir string          Folder contain default signatures (default "~/.jaeles/base-signatures/")
  -s, --signs strings           Signature selector (Multiple -s flags are accepted)
      --single                  Disable parallel mode (use this when you need logic in single signature
      --sp string               Selector for passive detections (default "*")
  -O, --summaryOutput string    Summary output file
      --timeout int             HTTP timeout (default 20)
  -v, --verbose                 Verbose

Use "jaeles [command] --help" for more information about a command.

```