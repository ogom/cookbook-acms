a-blog cms Cookbook
===================

Chef cookbook with recipes to install a-blog cms.

## Supported Platforms

* Ubuntu (12.04, 12.10)

## Installation

```bash
bundle install --path=.bundle
bundle exec vagrant up
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

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (i.e. `add-new-recipe`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

## Links

* [Developer](http://developer.a-blogcms.jp)

## Authors

* [ogom](https://github.com/ogom)

## License

* MIT
