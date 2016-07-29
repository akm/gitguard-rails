# gitguard

`gitguard` supports to avoid mixing human code and generated code in a git commit.

If there is/are change(s) to be commit, `gitguard` quits the command
before you run command which generates something like this:

```bash
$ bin/rails g migtation create_books title:string
[gitguard] There are files that need to be committed first.
[gitguard] git status
On branch features/gitguard
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   Gemfile
	modified:   Gemfile.lock

no changes added to commit (use "git add" and/or "git commit -a")
```

`gitguard` supports not only `bin/rails generate` but `rake` tasks.
You can configure rake task names in `.gitguard` file.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gitguard', group: :development
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gitguard

## Setup

```bash
$ bin/rails generate gitguard:install
```

A file `.gitguard` will be generated. You can configure the behavior by editing the file.

## Usage

Nothing special to do after setup. You can use `rails generate` and `rake` like before.

### Disabling

If you don't want to commit the changes, you can disable gitguard by environment variable `GITGUARD` like this:

```bash
$ bin/rails db:migrate GITGUARD=off
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/akm/gitguard. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

