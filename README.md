# Badges

Badges is a Ruby gem that allows you to connect to different API's to retrieve your earned badges and profile information.

## Installation

Add this line to your application's Gemfile:

    gem 'badges'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install badges

## Requirements

* Ruby 1.9.3 or higher
* httparty

## Usage

CodeSchool example:

    codeschool = Badges::CodeSchool.new('username')
    
    codeschool.username
    => "username"
    
    codeschool.profile_url
    => "http://www.codeschool.com/users/username"
    
    codeschool.avatar_url
    => "http://example.com/avatar.jpg"
    
    codeschool.courses_completed
    => [{"title"=>"Course", "url"=>"http://example.com", "badge"=>"http://example.com/badge.png"}]
    
    codeschool.courses_completed[0]['title']
    => "Course"
    
    codeschool.courses_in_progress
    => [{"title"=>"Course", "url"=>"http://example.com", "badge"=>"http://example.com/badge.png"}]
    
    codeschool.member_since
    => "2011-03-22T06:54:21Z"
    
    codeschool.total_score
    => "<b>114225</b>"
    
Team Treehouse example:

    treehouse = Badges::Treehouse.new('profile_name')
    
    treehouse.profile_name
    => "profile_name"
    
    treehouse.profile_url
    => "http://teamtreehouse.com/profile_name"
    
    treehouse.badges
    => [{"id"=>49, "name"=>"Badge", "url"=>"http://example.com", "icon_url"=>"http://example.com/badge.png", "earned_date"=>"2012-09-11T18:41:13Z", "courses"=>[]}]

    treehouse.badges[0]['name']
    => "Badge"
    
    treehouse.gravatar_url
    => "http://example.com/avatar.jpg"
    
    treehouse.name
    => "First Last"
    
    treehouse.points
    => {"total"=>1740, "html"=>447, "css"=>483, "javascript"=>0, "ruby"=>0, "ios"=>0, "business"=>0, "android"=>0, "php"=>0, "wordpress"=>0, "design"=>180, "dev tools"=>0}
    
    treehouse.points_total
    => 1740

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
