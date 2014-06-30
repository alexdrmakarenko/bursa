=begin

Создать класс Person, который можно проинициализировать таким образом:

person = Person.new('Oksana', '03-12-1991')

Конструктор принимает 2 параметра: name, birthday в формате, указанном выше. 
Для того, чтоб привести данную строку к дате, используем метод Date.parse(birthday).

Задание № 1. Написать метод age, который определяет возраст человека.

Задание № 2. Создать классы Woman и Man - наследники класса Person. Для каждого класса
определить среднюю продолжительность жизни в методе avg_life( Person: 68, Woman: 74, Man: 62).
Написать метод older_than_avg?, который возвращает true или false в зависимости от того, больше
ли возраст данного объекта чем средняя продолжительность жизни для этого класса.

person.older_than_avg?

Задание № 3. Написать метод can_marry?(person), который будет возвращать true или false в
зависимости от того, может ли данный человек вступить в брак с тем, который передается 
параметром. При этом:
 - мужчина может жениться с 18 лет
 - женщина может выйти замуж с 17 лет
 - однополые браки не разрешены
 - если один из брачующихся - объект класса Person, нужно raise TypeError

woman = Woman.new('Alina', '03-12-1990')
man   = Man.new('Ivan', '03-12-1985')
man.can_marry?(woman) #=> true
=end

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
