# gitguard-rails

`gitguard-rails` supports to avoid mixing human code and generated code in a git commit.

If there is/are change(s) to be commit, `gitguard-rails` stops the command
before you run command which generates something.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gitguard-rails', group: :development
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gitguard-rails

## Setup

```bash
bin/rails generate gitguard:install
```

A file `.gitguard` will be generated. You can configure the behavior by editing the file.

## Usage

Nothing special to do after setup.


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/akm/gitguard-rails. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

