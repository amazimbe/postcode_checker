# frozen_string_literal: true

class FetchPostcode
  def self.call(postcode)
    response = Faraday.get(url(postcode)) do |req|
      req.headers['Accept'] = 'application/json'
    end
    JSON.parse(response.body)
  end

  def self.url(postcode)
    raise RuntimeError if ENV['POSTCODE_API_URL'].nil?

    "#{ENV['POSTCODE_API_URL']}/#{ERB::Util.url_encode(postcode)}"
  end
end
