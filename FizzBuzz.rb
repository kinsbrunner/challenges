def foobar(limit = 1)
  limit.times do |num|
    num += 1
    if(num % 3 == 0 && num % 5 == 0)
      puts "FooBar"
    elsif(num % 3 == 0)
      puts "Foo"
    elsif (num % 5 == 0)
      puts "Bar"
    else
      puts num
    end
  end
end

foobar(100)