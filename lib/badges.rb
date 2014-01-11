require 'badges/version'
require 'httparty'

module Badges
  class Badge
    include HTTParty
    attr_reader :user_id, :profile_url
    
    def initialize(user_id, base_url)
      @user_id = user_id
      @profile_url = base_url + user_id
      @response = get(profile_url + '.json')
    end
    
    private
    
    def get(url)
      begin
        JSON.parse HTTParty.get(url).response.body
      rescue
        nil
      end
    end
    
    def obtain_key(hash, key)
      if hash.has_key?(key)
        hash[key]
      end
    end
  end
  
  class CodeSchool < Badge
    def initialize(user_id)
      super(user_id, 'http://www.codeschool.com/users/')
    end
    
    def avatar_url
      user = obtain_key @response, 'user'
      obtain_key user, 'avatar' if !user.blank?
    end
    
    def badges
      obtain_key @response, 'badges'
    end
    
    def courses_completed
      courses = obtain_key @response, 'courses'
      obtain_key courses, 'completed' if !courses.blank?
    end
    
    def courses_in_progress
      courses = obtain_key @response, 'courses'
      obtain_key courses, 'in_progress' if !courses.blank?
    end
    
    def member_since
      user = obtain_key @response, 'user'
      obtain_key user, 'member_since' if !user.blank?
    end
    
    def total_score
      user = obtain_key @response, 'user'
      obtain_key user, 'total_score' if !user.blank?
    end
  end
  
  class Treehouse < Badge
    def initialize(user_id)
      super(user_id, 'http://teamtreehouse.com/')
    end
    
    def badges
      obtain_key @response, 'badges'
    end
    
    def gravatar_url
      obtain_key @response, 'gravatar_url'
    end
    
    def name
      obtain_key @response, 'name'
    end
    
    def points
      obtain_key @response, 'points'
    end
    
    def points_total
      points = obtain_key @response, 'points'
      obtain_key points, 'total' if !points.blank?
    end
  end
end

require 'badges/railtie' if defined?(Rails)
