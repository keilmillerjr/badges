require 'badges/version'
require 'active_support/core_ext/object/blank'
require 'httparty'

module Badges
  class Badge
    include HTTParty
    attr_reader :user_id, :profile_url, :response
    
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
      
      @response = nil if obtain_key(@response, 'error')
    end
    
    def avatar_url
      user = obtain_key @response, 'user' if @response
      obtain_key user, 'avatar' if !user.blank?
    end
    
    def badges
      obtain_key @response, 'badges' if @response
    end
    
    def courses_completed
      courses = obtain_key @response, 'courses' if @response
      obtain_key courses, 'completed' if !courses.blank?
    end
    
    def courses_in_progress
      courses = obtain_key @response, 'courses' if @response
      obtain_key courses, 'in_progress' if !courses.blank?
    end
    
    def member_since
      user = obtain_key @response, 'user' if @response
      obtain_key user, 'member_since' if !user.blank?
    end
    
    def total_score
      user = obtain_key @response, 'user' if @response
      obtain_key user, 'total_score' if !user.blank?
    end
  end
  
  class Treehouse < Badge
    def initialize(user_id)
      super(user_id, 'http://teamtreehouse.com/')
    end
    
    def avatar_url
      obtain_key @response, 'gravatar_url' if @response
    end
    
    def badges
      obtain_key @response, 'badges' if @response
    end
    
    def full_name
      obtain_key @response, 'name' if @response
    end
    
    def points
      obtain_key @response, 'points' if @response
    end
    
    def points_android
      points = obtain_key @response, 'points' if @response
      obtain_key points, 'android' if !points.blank?
    end
    
    def points_business
      points = obtain_key @response, 'points' if @response
      obtain_key points, 'business' if !points.blank?
    end
    
    def points_css
      points = obtain_key @response, 'points' if @response
      obtain_key points, 'css' if !points.blank?
    end
    
    def points_design
      points = obtain_key @response, 'points' if @response
      obtain_key points, 'design' if !points.blank?
    end
    
    def points_dev_tools
      points = obtain_key @response, 'points' if @response
      obtain_key points, 'dev tools' if !points.blank?
    end
    
    def points_html
      points = obtain_key @response, 'points' if @response
      obtain_key points, 'html' if !points.blank?
    end
    
    def points_ios
      points = obtain_key @response, 'points' if @response
      obtain_key points, 'ios' if !points.blank?
    end
    
    def points_javascript
      points = obtain_key @response, 'points' if @response
      obtain_key points, 'javascript' if !points.blank?
    end
    
    def points_php
      points = obtain_key @response, 'points' if @response
      obtain_key points, 'php' if !points.blank?
    end
    
    def points_ruby
      points = obtain_key @response, 'points' if @response
      obtain_key points, 'ruby' if !points.blank?
    end
    
    def points_total
      points = obtain_key @response, 'points' if @response
      obtain_key points, 'total' if !points.blank?
    end
    
    def points_wordpress
      points = obtain_key @response, 'points' if @response
      obtain_key points, 'wordpress' if !points.blank?
    end
  end
end

require 'badges/railtie' if defined?(Rails)
