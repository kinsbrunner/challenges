require 'active_support/all'

num = 2
f = 1.0
string = "Helo"

hash = {
  1 => "One",
  2 => "Two",
  3 => "Three",
  4 => "Four"
}

#puts hash.to_json

json_string = '{"1":"One","2":"Two","3":"Three","4":"Four"}'
parsed = ActiveSupport::JSON.decode(json_string)
#puts parsed.inspect

puts parsed[1].inspect
puts parsed["1"].inspect
puts hash[1].inspect