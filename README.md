# Numbersapi

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'numbersapi', github: 'tab/numbersapi'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install numbersapi

## Usage

#### Date

```
Numbersapi.date(day, month)
````

```
Numbersapi.date(31, 12)
```

```
{
  "text": "December 31st is the day in 1999 that the United States Government hands control of the Panama Canal (as well all the adjacent land to the canal known as the Panama Canal Zone) to Panama.",
  "year": 1999,
  "number": 366,
  "found": true,
  "type": "date"
}
```

#### Random

```
Numbersapi.random
```

```
{
  "text": "360000 is the number of words definitions in the New Oxford Dictionary of English.",
  "number": 360000,
  "found": true,
  "type": "trivia"
}
```

#### Math

```
Numbersapi.math(number)
```

```
Numbersapi.math(255)
```

```
{
  "text": "255 is a repdigit in base 2 (11111111) in base 4 (3333), and in base 16 (FF).",
  "number": 255,
  "found": true,
  "type": "math"
}
```

#### Trivia

```
Numbersapi.trivia(number)
```

```
Numbersapi.trivia(42)
```

```
{
  "text": "42 is the result given by the web search engines Google, Wolfram Alpha and Bing when the query \"the answer to life the universe and everything\" is entered as a search.",
  "number": 42,
  "found": true,
  "type": "trivia"
}
```

#### Year

```
Numbersapi.year(number)
```

```
Numbersapi.year(2020)
```

```
{
  "text": "2020 is the year that Earliest year that power aboard the space probes Voyager 1 and Voyager 2 is expected to terminate (though either probe may function past this date).",
  "number": 2020,
  "found": true,
  "type": "year"
}
```

### Query parameter options

#### fragment

```
Numbersapi.trivia(23, {fragment: true})
```

```
{
  "text": "the number of times Julius Caesar was stabbed",
  "number": 23,
  "found": true,
  "type": "trivia"
}
```

#### notfound

```
Numbersapi.math(314159265358979)
```

```
{
  "text": "314159265358979 is a number for which we're missing a fact (submit one to numbersapi at google mail!).",
  "number": 314159265358979,
  "found": false,
  "type": "math"
}
```

notfound = floor

```
Numbersapi.trivia(35353, {notfound: :floor})
```

```
{
  "text": "35000 is the number of genes in a human being.",
  "number": "35000",
  "found": false,
  "type": "trivia"
}
```

notfound = ceil

```
Numbersapi.year(-12344, {notfound: :ceil})
```

```
{
  "text": "1225 BC is the year that ramses II, a pharaoh of Egypt died, having fathered 96 sons and 60 daughters.",
  "number": "-1225",
  "found": false,
  "type": "year"
}
```

#### default

```
Numbersapi.year(1234567890987654321, {default: "Boring number is boring"})
```

```
{
  "text": "Boring number is boring",
  "number": 1234567890987654400,
  "found": false,
  "type": "year"
}
```

#### min & max

```
Numbersapi.random({min: 10, max: 20})
```

```
{
  "text": "17 is the number of syllables in a haiku (5+7+5).",
  "number": 17,
  "found": true,
  "type": "trivia"
}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tab/numbersapi. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/tab/numbersapi/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Numbersapi project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/tab/numbersapi/blob/master/CODE_OF_CONDUCT.md).
