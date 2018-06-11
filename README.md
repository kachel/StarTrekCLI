# StarTrekCLI

A CLI tool to query Star Trek info! Happy searching trekkies.


> This gem uses the website http://chakoteya.net/.
>
> The library will currently aggressively cache the whole site – this is *not* production quality.
>
> If you use this, make sure to [send some tea money][Paypal] to Chrissie, who was able to make this gem happen.

[Paypal]: <https://www.paypal.com/donate/?token=qv0Imb4exBKKrVsAc0tQrSUxlNgAgaldDhQDu6sQ-o0YSK5bNQcUMVpTC9Qp26kun4dgE0&country.x=GB&locale.x=GB>

## Installation

Add this line to your application's Gemfile, if you want to use this as a library:

```ruby
gem 'StarTrekCLI'
```

And then execute:

    $ bundle StarTrekCLI

Or install it yourself for command line usage:

    $ gem install StarTrekCLI

## Usage

    $ startrek --help
    $ startrek --list-series
    $ startrek --list-episode-info 'The Next Generation':2:129

StarTrekCLI will walk you through the chain of commands.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the StarTrekCLI project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/StarTrekCLI/blob/master/CODE_OF_CONDUCT.md).
