

require 'date'

class Person
  attr_accessor :name, :birthday
	def initialize(name, birthday)
	  @name     = name
	  @birthday = Date.parse(birthday)
	end

	def age
	  a = DateTime.now.year - birthday.year
	end
	
	def self.avg_life
		$LIFE = 68
	end


	def can_marry?(person)
	  raise TypeError   if person.class.eql?(Person)

			
	  return true ? self.class != person.class && self.age >= 18 : false
	end
			
	def older_than_avg?
      if self.age > Person.avg_life
      	return true
      else
      	return false
      end
	end
end

class Man < Person
  def self.avg_life
	$LIFE = 62
	
  end
end

class Woman < Person
  def self.avg_life
	$LIFE = 74
  end
end
  

if __FILE__ == $0
  person = Person.new('Sasha', '28-07-1940')
  puts person.name
  puts person.birthday

  puts person.age
  puts person.avg_life
  puts person.older_than_avg?
end
