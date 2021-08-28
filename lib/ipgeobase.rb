# frozen_string_literal: true

require_relative 'ipgeobase/version'
require 'addressable/uri'
require 'net/http'

# API parsing module for ip-api
module Ipgeobase
  class Error < StandardError; end
  autoload 'DataParse', 'ipgeobase/dataparser'

  def self.lookup(adress)
    api_uri = Addressable::URI.parse("http://ip-api.com/xml/#{adress}")
    data_api = api_answer(api_uri)

    DataParse.parse(data_api)
  end

  def self.api_answer(uri)
    Net::HTTP.get(uri)
  end
end
