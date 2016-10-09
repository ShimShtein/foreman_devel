# ForemanDevel

This gem adds functionality for foreman plugin developers.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'foreman_devel'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install foreman_devel

## Usage

### Generators

- Migrations: You can add migrations to your plugin by using
`foreman_plugin:migration` generator. The syntax is identical to
`rails g migration` generator, so refer to rails for more info. This generator
also adds two switches: `--plugin-name` that should receive the name of the
plugin that will receive the migration and `--plugin-source` (optional) that
should receive relative path to folder where recipient plugin code is. If
`plugin-source` is not specified, the generator will assume that the source is
located at `../plugin_name/` folder.

``` sh
rails generate foreman_plugin:migration AddFieldToMyTable field:string --plugin-name="my_plugin" --plugin-source="../my_plugin_folder"
```



## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/shimshtein/foreman_devel.


## License

The gem is available as open source under the terms of the [LGPL-3.0](https://opensource.org/licenses/LGPL-3.0).
