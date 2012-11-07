# OSMN
A Ruby wrapper for the OpenStreetMap Nominatim API.

> Nominatim is a tool to search osm data by name and address 
and to generate synthetic addresses of osm points (reverse geocoding). 

Service can be found at http://nominatim.openstreetmap.org 
API Details can be found at http://wiki.openstreetmap.org/wiki/Nominatim

## Installation

    $ gem install osmn

## Usage
The easy way:
```ruby
# search for a place
OSMN::search('135 pilkington avenue, birmingham')

# convert latitude and longitude into a place
OSMN::reverse_geocode(52.5487429714954, -1.81602098644987)
```
The full control way:
```ruby
# search for address
search = OSMN::Search.new(:addressdetails => 1)
search.params = {:limit => 1}

# you can revise the params used
search.params
# >> {:addressdetails => 1, :limit => 1}

# and if all is ok, you can execute the query
search.search
```

```ruby
# convert lat and long
search = OSMN::Reverse.new(:lat => 52.5487429714954)
search.params = {:lon => -1.81602098644987}

# check the params
search.params
# >> {:lat => 52.5487429714954, :lon => -1.81602098644987}

# run the query
search.reverse_geocode
```

Check the available parameters for each query on the Nominatim Wiki page (http://wiki.openstreetmap.org/wiki/Nominatim)

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