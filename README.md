# amenitiz

## Requirements

This project has been created with ruby 2.7.8 version in mind. If you are using a ruby version manager, this will be automatically picked up.
In case you don't have the correct version, running `rbenv install` or `rvm install` should set you up.

## Installation

In order to have all the necessary gems for this to be ran locally, please do

`bundle install`

## Usage

In order to run the tests automatically

`bundle exec rake spec`

In order to run rubocop

`bundle exec rake rubocop`

You can run `bin/console` for an interactive prompt that will allow you to experiment.

To start the CLI that will request you with a comma separated list of products, run `bin/amenitiz`

## Testing

In case you'd like to provide with a list of elements for testing purposes, assuming that these are
an array of products such as `['P1', 'P2', ...]` then starting the console and loading the product list
either via CSV or directly on console, and calling `BasketTotalCalculator.new(product_list: product_list).calculate_total`
should return you with an array containing the total amount on the first element, and any missing products
on the latter.
