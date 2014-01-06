require 'badges/version'
require 'httparty'

module Badges
  class Badge
    include HTTParty
    
    private
    
    def get(url)
      begin
        JSON.parse HTTParty.get(url).response.body
      rescue
        nil
      end
    end
  end
  
  class CodeSchool < Badge
    attr_reader :profile_url, :username
    
    def initialize(username)
      @username = username
      @profile_url = 'http://www.codeschool.com/users/' + @username
      
      @response = get(@profile_url + '.json')
    end
    
    def avatar_url
      begin
        @response['user']['avatar']
      rescue
        nil
      end
    end
    
    def badges
      begin
        @response['badges']
      rescue
        nil
      end
    end
    
    def courses_completed
      begin
        @response['courses']['completed']
      rescue
        nil
      end
    end
    
    def courses_in_progress
      begin
        @response['courses']['in_progress']
      rescue
        nil
      end
    end
    
    def member_since
      begin
        @response['user']['member_since']
      rescue
        nil
      end
    end
    
    def total_score
      begin
        @response['user']['total_score']
      rescue
        nil
      end
    end
  end
  
  class Treehouse < Badge
    attr_reader :profile_name, :profile_url
    
    def initialize(profile_name)
      @profile_name = profile_name
      @profile_url = 'http://teamtreehouse.com/' + @profile_name
      
      @response = get(@profile_url + '.json')
    end
    
    def badges
      begin
        @response['badges']
      rescue
        nil
      end
    end
    
    def gravatar_url
      begin
        @response['gravatar_url']
      rescue
        nil
      end
    end
    
    def name
      begin
        @response['name']
      rescue
        nil
      end
    end
    
    def points
      begin
        @response['points']
      rescue
        nil
      end
    end
    
    def points_total
      begin
        @response['points']['total']
      rescue
        nil
      end
    end
  end
end
