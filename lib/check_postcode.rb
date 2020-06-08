# frozen_string_literal: true

class CheckPostcode
  LSOA = %w[Southwark Lambeth].freeze

  def self.call(response)
    return true if response['status'] == 404
    return response['result']['lsoa'].start_with?(*LSOA) if response['status'] == 200

    false
  end
end
