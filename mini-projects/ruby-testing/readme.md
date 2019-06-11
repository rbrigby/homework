
# Ruby Testing

## Guides
* [Factory Bot Getting Started](https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md) - fixture replacement for ruby applications
* [ROR Guides - Testing](https://guides.rubyonrails.org/testing.html) - official rails guide page dedicated to testing.
* [Factory Bot Best Practices](https://blog.codeship.com/factory-girl-best-practices/) - 7 minute video introduces factory_bot and shows moving from fixtures to factories
* [Random vs Sorted Tests](https://guides.rubyonrails.org/upgrading_ruby_on_rails.html#activesupport-testcase-default-test-order-is-now-random) - Rails 5 added `:random` test ordering. This can be set back to `:sorted` if necessary


## Gems
* [Byebug](https://github.com/deivid-rodriguez/byebug) - ruby debugger
  * [Sublime Debugger](https://github.com/shuky19/sublime_debugger) - sublime based debugger.
  * [Atom Debugger](https://github.com/izaera/atom-byebug) - atom based debugger
* [Minitest](https://github.com/blowmage/minitest-rails) - test framework that ships with rails
* [Pry](https://github.com/pry/pry) - Runtime developer console
* [Rspec](https://github.com/rspec/rspec) - BDD for Ruby (meta gem, see below for all of rspec)
  * [Rspec Core](https://github.com/rspec/rspec-core) - rspec runner and formatters
  * [Rspec Expectations](https://github.com/rspec/rspec-expectations) - rspec expect()
  * [Rspec Mocks](https://github.com/rspec/rspec-mocks) - test-double framework with support for stubs, fakes
* [SimpleCov](https://github.com/colszowka/simplecov) - Creates html based coverage report in `/coverage` directory
* [Spring](https://github.com/rails/spring) - Rails preloader - Calls `Process.fork`

## Testing QuickStart
Bundle by Group

```bundle install --with development```

Schema Load

```rails:db:schema:load RAILS_ENV=test```

Rails Console

```rails c -e test```

Generate Model Test

```rails g test_unit:model [snake_model_name]```

Generate Controller Test

```rails g test_unit:scaffold [snake_model_name]```

## Cheatsheets
* [docker](https://devhints.io/docker)
* [docker-compose](https://devhints.io/docker-compose)
* [factory_bot](https://devhints.io/factory_bot)
* [minitest](https://devhints.io/minitest)
* [rspec](https://devhints.io/rspec)

## Comparisons
* [Tenderlove Rspec vs MiniTest](https://tenderlovemaking.com/2015/01/23/my-experience-with-minitest-and-rspec.html)
