---
layout: default
title:  Overview
---

Chef cookbook with recipes to install a-blog cms.

![acms]({{ site.baseurl }}/assets/img/acms.gif)

## Supported Platforms

* Ubuntu (12.04, 12.10)

## Installation

```bash
git clone https://github.com/ogom/cookbook-acms.git
cd cookbook-acms/
bundle install --path=.bundle
bundle exec vagrant up
open http://192.168.6.4/
```

### Amazon Web Services (AWS)

```bash
cp example/Vagrantfile_aws Vagrantfile
bundle exec vagrant up --provider=aws
open http://[subdomain].amazonaws.com/
```

## Attributes

* Application
* Database

## Usage

### acms::default

Include `acms` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[acms::default]"
  ]
}
```

## Links

* [a-blog cms developer](http://developer.a-blogcms.jp)

## Authors

* [ogom](https://github.com/ogom)

## License

* MIT
