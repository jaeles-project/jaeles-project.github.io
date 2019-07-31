---
title: "Installation"
date: 2019-07-31T13:17:33+07:00
weight: 2
draft: false
---

## Jaeles installation

[Video Guide](https://youtube.com/)

#### Core Install

```
git clone https://github.com/j3ssie/Jaeles
cd Jaeles
./install.sh
source jenv/bin/activate
```

#### Run Django Application
```
python3 manage.py runserver
```
Then open your browser at http://127.0.0.1:8000. You gonna need create an user for Web UI access.
```
python3 manage.py createsuperuser
```

***

After create new user you gonna need default data to get stared. Run default data setup to gen some default data for you.

```
python3 scripts/reset.py
```

*** 

### Running background task using redis
This is not mandatory but it allow to Jaeles to run background task automatically.

Make sure you have **Redis** installed or check this install guide if you're on [Mac](https://medium.com/@petehouston/install-and-config-redis-on-mac-os-x-via-homebrew-eb8df9a4f298) or [*nix](https://stackoverflow.com/questions/21795340/linux-install-redis-cli-only).

### Run redis server
```
redis-server
```

#### Run celery
Navigate to `Jaeles/jaeles/` then run

```
celery -A jaeles worker -l info
```

Check out install page on **[Wiki](https://github.com/j3ssie/Jaeles/wiki)** for more detail.
