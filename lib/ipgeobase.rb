# frozen_string_literal: true

require_relative "ipgeobase/version"
require "addressable/uri"
require 'net/http'

module Ipgeobase
  class Error < StandardError; end
  # Your code goes here...
  autoload 'DataParse', 'ipgeobase/dataparser'

  def self.lookup(adress)
    api_uri = Addressable::URI.parse("http://ip-api.com/xml/#{adress}")
    dataApi = api_answer(api_uri)

    DataParse.parse(dataApi)
  end

  def self.api_answer(uri)
    Net::HTTP.get(uri)
  end
end
