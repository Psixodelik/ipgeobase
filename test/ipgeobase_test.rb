# frozen_string_literal: true

require 'test_helper'
require 'webmock/minitest'
require 'net/http'

class IpgeobaseTest < Minitest::Test
  def before_setup
    WebMock.stub_request(:get, 'http://ip-api.com/xml/8.8.8.8').
      to_return(body: File.open("#{File.dirname(__FILE__)}/fixture/api.xml"), status: 200)
  end

  def test_exist_api_methods
    api_methods = %w[city country countryCode lat lon]
    ip = Ipgeobase.lookup('8.8.8.8')

    api_methods.each do |method|
      assert ip.respond_to?(method), "#{method} method not found"
    end
  end

  def test_city_method
    ip = Ipgeobase.lookup('8.8.8.8')

    assert_equal ip.city.class, String
    assert_equal ip.city, "Montreal"
  end


  def test_country_method
    ip = Ipgeobase.lookup('8.8.8.8')

    assert_equal ip.country.class, String
    assert_equal ip.country, "Canada"
  end

  def test_countryCode_method
    ip = Ipgeobase.lookup('8.8.8.8')

    assert_equal ip.countryCode.class, String
    assert_equal ip.countryCode, "CA"
  end

  def test_lat_method
    ip = Ipgeobase.lookup('8.8.8.8')

    assert_equal ip.lat.class, Float
    assert_equal ip.lat, 45.5808
  end

  def test_lon_method
    ip = Ipgeobase.lookup('8.8.8.8')

    assert_equal ip.lon.class, Float
    assert_equal ip.lon, -73.5825
  end
end
