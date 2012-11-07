require 'test/unit'
require 'osmn'

class Tests < Test::Unit::TestCase

  def test_nil_search
    response = OSMN::search

    assert_equal(nil, response)
  end

  def test_nil_reverse
    response = OSMN::reverse_geocode

    assert_equal(nil, response)
  end

  def test_search
    response = OSMN::search('135 pilkington avenue, birmingham')[0]

    assert_equal('62311100', response.place_id)
  end

  def test_reverse
    response = OSMN::reverse_geocode(52.5487429714954, -1.81602098644987)

    assert_equal('62762024', response.place_id)
  end

  def test_search
    response = OSMN::search('135 pilkington avenue, birmingham', 0)[0]

    assert_respond_to(response, :place_id)
    assert_respond_to(response, :licence)
    assert_respond_to(response, :osm_type)
    assert_respond_to(response, :osm_id)
    assert_respond_to(response, :boundingbox)
    assert_respond_to(response, :lat)
    assert_respond_to(response, :lon)
    assert_respond_to(response, :display_name)
    assert_respond_to(response, :class)
    assert_respond_to(response, :type)

    assert_raise NoMethodError do
      response.address
    end
  end


  def test_search_with_details
    response = OSMN::search('135 pilkington avenue, birmingham', 1)[0]

    assert_respond_to(response, :place_id)
    assert_respond_to(response, :licence)
    assert_respond_to(response, :osm_type)
    assert_respond_to(response, :osm_id)
    assert_respond_to(response, :boundingbox)
    assert_respond_to(response, :lat)
    assert_respond_to(response, :lon)
    assert_respond_to(response, :display_name)
    assert_respond_to(response, :class)
    assert_respond_to(response, :type)
    assert_respond_to(response, :address)

    assert_respond_to(response.address, :house_number)
    assert_respond_to(response.address, :road)
    assert_respond_to(response.address, :suburb)
    assert_respond_to(response.address, :city)
    assert_respond_to(response.address, :county)
    assert_respond_to(response.address, :state_district)
    assert_respond_to(response.address, :state)
    assert_respond_to(response.address, :postcode)
    assert_respond_to(response.address, :country)
    assert_respond_to(response.address, :country_code)
  end

  def test_reverse_geocode
    response = OSMN::reverse_geocode(52.5487429714954, -1.81602098644987, 0)

    assert_respond_to(response, :place_id)
    assert_respond_to(response, :licence)
    assert_respond_to(response, :osm_type)
    assert_respond_to(response, :osm_id)
    assert_respond_to(response, :lat)
    assert_respond_to(response, :lon)
    assert_respond_to(response, :display_name)

    assert_raise NoMethodError do
      response.address
    end
  end

  def test_reverse_geocode_with_address_details
    response = OSMN::reverse_geocode(52.5487429714954, -1.81602098644987, 1)

    assert_respond_to(response, :place_id)
    assert_respond_to(response, :licence)
    assert_respond_to(response, :osm_type)
    assert_respond_to(response, :osm_id)
    assert_respond_to(response, :lat)
    assert_respond_to(response, :lon)
    assert_respond_to(response, :display_name)
    assert_respond_to(response, :address)

    assert_respond_to(response.address, :house_number)
    assert_respond_to(response.address, :road)
    assert_respond_to(response.address, :suburb)
    assert_respond_to(response.address, :city)
    assert_respond_to(response.address, :county)
    assert_respond_to(response.address, :state_district)
    assert_respond_to(response.address, :state)
    assert_respond_to(response.address, :postcode)
    assert_respond_to(response.address, :country)
    assert_respond_to(response.address, :country_code)
  end
end
