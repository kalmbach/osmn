# OSMN [![Code Climate](https://codeclimate.com/github/kalmbach/osmn.png)](https://codeclimate.com/github/kalmbach/osmn)

A Ruby wrapper for the OpenStreetMap Nominatim API.

> Nominatim is a tool to search osm data by name and address 
and to generate synthetic addresses of osm points (reverse geocoding). 

Service can be found at http://nominatim.openstreetmap.org 
API Details can be found at http://wiki.openstreetmap.org/wiki/Nominatim

## Installation

    $ gem install osmn

## Usage
### The easy way:
```ruby
# search for a place
OSMN::search('135 pilkington avenue, birmingham')

# convert latitude and longitude into a place
OSMN::reverse_geocode(52.5487429714954, -1.81602098644987)
```
### The full control way:
#### Search
```ruby
# search for address
# required params: q (the query)
search = OSMN::Search.new(:q => '135 pilkington avenue, birmingham')
search.params = {:limit => 1}

# you can revise the params used
search.params
# >> {:q => '135 pilkington avenue, birmingham', :limit => 1}

# and if all is ok, you can execute the query
search.search
```
You can set any parameter defined in the Nominatim wiki page (http://wiki.openstreetmap.org/wiki/Nominatim#Parameters)
```ruby
# example parameters
params = {
    :q => '135 pilkington avenue, birmingham', 
    :'accept-language' >= 'en', 
    :countrycodes => 'gb', 
    :bounded => 1, 
    :polygon => 1, 
    :addressdetails => 1
}
```
#### Reverse Geocode
```ruby
# convert lat and long
# required params: lat, lon (latitude and longitude)
search = OSMN::Reverse.new(:lat => 52.5487429714954)
search.params = {:lon => -1.81602098644987}

# check the params
search.params
# >> {:lat => 52.5487429714954, :lon => -1.81602098644987}

# run the query
search.reverse_geocode
```
You can set any parameter defined in the Nominatim wiki page (http://wiki.openstreetmap.org/wiki/Nominatim#Parameters_2)
```ruby
# example parameters
params = {
    :lat => 52.5487429714954, 
    :lon => -1.81602098644987, 
    :'accept-language' => 'en', 
    :osm_type => 'W', 
    :zoom => 18, 
    :addressdetails => 1
}
```

Check the complete list of parameters for each query on the Nominatim Wiki page (http://wiki.openstreetmap.org/wiki/Nominatim)

## License
Copyright (c) 2012, Jorge Kalmbach <kalmbach.at.gmail.com>

Permission is hereby granted, free of charge, to any
person obtaining a copy of this software and associated
documentation files (the "Software"), to deal in the
Software without restriction, including without limitation
the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the
Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice
shall be included in all copies or substantial portions of
the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS
OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
