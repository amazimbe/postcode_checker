# frozen_string_literal: true

require 'sinatra/base'
require 'dotenv/load'
require 'faraday'
require_relative './lib/fetch_postcode'
require_relative './lib/check_postcode'

class PostcodeChecker < Sinatra::Base
  get '/' do
    erb :homepage
  end

  run! if __FILE__ == $PROGRAM_NAME
end
