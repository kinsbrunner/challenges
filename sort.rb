class Person
  attr_reader :age, :name
  def initialize(name, age)
    @age = age
    @name = name
  end
end

ale = Person.new("Ale", 29)
meli = Person.new("Meli", 27)
marina = Person.new("Marina", 67)
pepe = Person.new("Pepe", 15)

people = [ale, meli, marina, pepe]

def sort_people(people, comparer)
  people.sort do |x, y|
    comparer.call(x) <=> comparer.call(y)
  end
end

grab_age = lambda do |person|
  person.age
end

sorted_people = sort_people(people, lambda{|person| person.age})

puts sorted_people.inspect