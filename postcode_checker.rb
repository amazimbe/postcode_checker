# frozen_string_literal: true

require 'sinatra/base'

class PostcodeChecker < Sinatra::Base
  get '/' do
    'Hello from Postcode checker!'
  end

  run! if __FILE__ == $PROGRAM_NAME
end
