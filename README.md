[![Badges Logo](badges.png)](https://github.com/keilmillerjr/badges)

By [Keil Miller Jr](http://keilmiller.com)

[![Gem Version](https://badge.fury.io/rb/badges.png)](http://badge.fury.io/rb/badges)

**badges** is a Ruby gem that allows you to connect to different API's to retrieve your earned badges and profile information.

## Installation

Add this line to your application's Gemfile:

    gem 'badges'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install badges

## Requirements

* Ruby 1.9.3 or higher
* activesupport
* httparty
* markaby

## Class usage

CodeSchool example:

    codeschool = Badges::CodeSchool.new('username')
    
    codeschool.response
    => nil # if false username
    
    codeschool.username
    => "username"
    
    codeschool.profile_url
    => "http://www.codeschool.com/users/username"
    
    codeschool.avatar_url
    => "http://example.com/avatar.jpg"
    
    codeschool.badges
    => [{"name"=>"Badge", "badge"=>"http://example.com/badge.png", "course_url"=>"http://example.com"}]
    
    codeschool.courses_completed
    => [{"title"=>"Course", "url"=>"http://example.com", "badge"=>"http://example.com/badge.png"}]
    
    codeschool.courses_in_progress
    => [{"title"=>"Course", "url"=>"http://example.com", "badge"=>"http://example.com/badge.png"}]
    
    codeschool.member_since
    => "2011-03-22T06:54:21Z"
    
    codeschool.total_score
    => "<b>114225</b>"
    
Team Treehouse example:

    treehouse = Badges::Treehouse.new('profile_name')
    
    treehouse.response
    => nil # if false username
    
    treehouse.profile_name
    => "profile_name"
    
    treehouse.profile_url
    => "http://teamtreehouse.com/profile_name"
    
    treehouse.avatar_url
    => "http://example.com/avatar.jpg"
    
    treehouse.badges
    => [{"id"=>49, "name"=>"Badge", "url"=>"http://example.com", "icon_url"=>"http://example.com/badge.png", "earned_date"=>"2012-09-11T18:41:13Z", "courses"=>[]}]
    
    treehouse.full_name
    => "First Last"
    
    treehouse.points
    => {"total"=>1740, "html"=>447, "css"=>483, "javascript"=>0, "ruby"=>0, "ios"=>0, "business"=>0, "android"=>0, "php"=>0, "wordpress"=>0, "design"=>180, "dev tools"=>0}
    
    treehouse.points_android
    => 1
    
    treehouse.points_business
    => 1
    
    treehouse.points_css
    => 1
    
    treehouse.points_design
    => 1
    
    treehouse.points_dev_tools
    => 1
    
    treehouse.points_html
    => 1
    
    treehouse.points_ios
    => 1
    
    treehouse.points_javascript
    => 1
    
    treehouse.points_php
    => 1
    
    treehouse.points_ruby
    => 1
    
    treehouse.points_total
    => 10
    
    treehouse.points_wordpress

## Rails helpers

Create new badge object in your controller.

    class BadgesController < ApplicationController
      def index
        @codeschool = Badges::CodeSchool.new('keilmillerjr')
        @treehouse = Badges::Treehouse.new('keilmillerjr')
      end
    end

Inside your view, use the class methods directly, or the list_badges helper to create a list of badges. Params left out are assumed to be false.

    <h1>Badges#index</h1>
    <p>Find me in app/views/badges/index.html.erb</p>
    
    <%= image_tag @codeschool.avatar_url %>
    <%= list_badges @codeschool, codeschool_badges: {image: true, link: true, text: true}, id: 'test', class: 'test' %>
    <%= list_badges @codeschool, codeschool_courses_completed: {image: true, link: true, text: true}, id: 'test', class: 'test' %>
    <%= list_badges @codeschool, codeschool_courses_in_progress: {image: true, link: true, text: true}, id: 'test', class: 'test' %>
    
    <%= @treehouse.avatar_url %>
    <%= list_badges @treehouse, treehouse_badges: {image: true, link: true, text: true}, id: 'test', class: 'test' %>

Tip: Use css/sass afterwards to style this list appropriately.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
