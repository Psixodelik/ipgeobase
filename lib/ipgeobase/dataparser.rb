require 'happymapper'

module Ipgeobase
  class DataParse
    include HappyMapper

    tag 'query'
    element :city, String
    element :country, String
    element :countryCode, String
    element :lat, Float
    element :lon, Float
  end
end
