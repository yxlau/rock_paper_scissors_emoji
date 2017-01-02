# RockPaperScissorsEmoji

A simple CLI interpretation of Rock, Paper, Scissors, but with a few emoji. It offers single and two-player mode, and allows you to choose the number of points required to ‘win’. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rock_paper_scissors_emoji'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rock_paper_scissors_emoji

## Usage

Once you’ve installed the gem, include it in your Ruby script or IRB session:

```ruby
require 'rock_paper_scissors_emoji'
```

Start the game with 

```ruby
RockPaperScissorsEmoji::play
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/yxlau/rock_paper_scissors_emoji.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

