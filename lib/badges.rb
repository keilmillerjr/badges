require 'badges/version'
require 'active_support/core_ext/object/blank'
require 'httparty'
require 'dish'

module Badges
  class Request
    include HTTParty
    attr_reader :user_id, :profile_url, :code, :message, :body
    
    def initialize(user_id, base_url)
      @user_id = user_id
      @profile_url = base_url + user_id
      
      response = HTTParty.get(@profile_url + '.json')
      
      @code = response.code
      @message = response.message
      @body = Dish parse(response.body)
      
      puts "#{self.class.name}: Response Error #{@code}, #{@message}" unless valid?
    end
    
    def valid?
      @code == 200 ? true : false
    end
    
    private
    
    def parse(body)
      JSON.parse body
      rescue JSON::ParserError
        nil
    end
  end
  
  class CodeSchool < Request
    def initialize(user_id, base_url='http://www.codeschool.com/users/')
      super(user_id, base_url)
    end
  end
  
  class Treehouse < Request
    def initialize(user_id, base_url='http://teamtreehouse.com/')
      super(user_id, base_url)
    end
  end
end

require 'badges/railtie' if defined?(Rails)
