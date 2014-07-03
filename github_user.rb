require 'json'
require 'net/http'
require_relative 'github_user'

module Github
  class User
	attr_accessor :name
	#def initialize name
	#  @name = name
	#end

	def self.all_users
      uri = URI("https://api.github.com/users")
      result = JSON.parse(Net::HTTP.get(uri), symbolize_names: true)
      result.map{ |hash| hash[:login] } 
    end	

    def info
      uri = URI("https://api.github.com/users/#{name}")
      result = JSON.parse(Net::HTTP.get(uri), symbolize_names: true)
      #result{ |hash| hash[:login] }
    end

    def id
       uri = URI("https://api.github.com/users/#{name}")
      result = JSON.parse(Net::HTTP.get(uri), symbolize_names: true)
      result[:id] 
    end
    
    def repos

      uri = URI("https://api.github.com/users/#{name}/repos")
      result = JSON.parse(Net::HTTP.get(uri), symbolize_names: true)
      if info.include?(:message)  
        return [] 
      else 
       	return result
      end

    end

    def repos_names
      uri = URI("https://api.github.com/users/#{name}/repos")
      result = JSON.parse(Net::HTTP.get(uri), symbolize_names: true)
      repos.collect { |x| x[:name] }
    end
    
    def total_repos_size
   	  uri = URI("https://api.github.com/users/#{name}/repos")
      result = JSON.parse(Net::HTTP.get(uri), symbolize_names: true)
      #result.map{ |a| a[:size] }.sum
       if info.include?(:message)
       	 return 0
       else
         amount = result.inject(0) {|sum, hash| sum + hash[:size]}
       end
    end

    def prefferable_languages
      uri = URI("https://api.github.com/users/#{name}/repos")
      result = JSON.parse(Net::HTTP.get(uri), symbolize_names: true)
      repos.collect { |x| x[:language] }

    end
  end
 end
