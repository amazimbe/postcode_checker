# Postcode checker

This app will inform a user if a given password is whitelisted or not.

## Setup

Recommended Ruby version 2.7.0

Install gems.

`bundle install`

Running the application at http://localhost:4567

`rackup -s thin -p 4567`

## Code linting
 
`bundle exec rubocop`

## Running Test Suite

Run all tests:

`bundle exec rspec`

## TODO

Instead of dotenv use the figaro gem so that we can specify
whitelisted LSOAs as a list. Currently, the list has been 
hardcoded.