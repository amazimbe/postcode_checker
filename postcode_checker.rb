# frozen_string_literal: true

require 'sinatra/base'
require 'dotenv/load'
require 'faraday'

require_relative './lib/fetch_postcode'
require_relative './lib/check_postcode'

class PostcodeChecker < Sinatra::Base
  get '/' do
    postcode = params[:postcode] if params[:postcode].to_s

    @msg = if postcode&.empty?
             'Enter a postcode'
           elsif postcode && whitelisted?(postcode)
             "#{postcode} is in the service area"
           elsif postcode && !whitelisted?(postcode)
             "#{postcode} is not in the service area"
           end
    erb :homepage
  end

  private

  def whitelisted?(postcode)
    response = FetchPostcode.call(postcode)
    CheckPostcode.call(response)
  end

  run! if __FILE__ == $PROGRAM_NAME
end
