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

Both *Badges::CodeSchool* and *Badges::Treehouse* are a subclass of *Request*. Because of this, they share the same methods and variables, and function in exactly the same way. Examples following the first will be considerably shorter.

#### Badges::CodeSchool

Create a new instance of a CodeSchool badge request.

    codeschool = Badges::CodeSchool.new('username')
    
Badges gem knows the proper url for the request. If the base url for the request happens to change one day, you can optionally pass in a different base url and the gem will use that instead.

    codeschool = Badges::CodeSchool.new('username', 'http://www.codeschool.com/users/')

CodeSchool is a subclass of Request, so it inherits these useful methods and variables pertaining to your api request.

    codeschool.user_id
    => "user"
    
    codeschool.profile_url
    => "http://www.codeschool.com/users/username"
    
    codeschool.valid?
    => true
    
    codeschool.code
    => 200
    
    codeschool.message
    => "OK"
    
Any error in the request will yield a message in the console or log.
    
Retrieved JSON is stored as a plain Ruby object inside the variable *codeschool.body*. Here's an example of proper usage:

    codeschool.body.user.avatar
    => "http://example.com/avatar.jpg"

    codeschool.body.courses.completed.count
    => 11
    
    codeschool.body.courses.completed[0].title
    => "Rails for Zombies"

You can view all the attributes of the JSON request online in a nice tree view gui by using the [Json Editor Online](http://www.jsoneditoronline.org).

#### Badges::Treehouse

    treehouse = Badges::Treehouse.new('username')

## Rails view helpers

#### list_badges

Create a new instance of a badge request in the controller.

    class BadgesController < ApplicationController
      def index
        @codeschool = Badges::CodeSchool.new('keilmillerjr')
        @treehouse = Badges::Treehouse.new('keilmillerjr')
      end
    end

Inside your view, use the list_badges view helper to create a list of badges. Params left out are assumed to be false. You can also use class methods and variables inside the view.

    <h1>Badges#index</h1>
    <p>Find me in app/views/badges/index.html.erb</p>
    
    <%= image_tag @codeschool.body.user.avatar %>
    <%= list_badges @codeschool, codeschool_badges: {image: true, link: true, text: true}, id: 'codeschool_badges', class: 'badges' %>
    <%= list_badges @codeschool, codeschool_courses_completed: {image: true, link: true, text: true}, id: 'codeschool_courses_completed', class: 'badges' %>
    <%= list_badges @codeschool, codeschool_courses_in_progress: {image: true, link: true, text: true}, id: 'codeschool_courses_in_progress', class: 'badges' %>
    
    <%= image_tag @treehouse.body.gravatar_url %>
    <%= list_badges @treehouse, treehouse_badges: {image: true, link: true, text: true}, id: 'treehouse_badges', class: 'badges' %>

Tip: Use css/sass afterwards to style this list appropriately.

*list_badges* will render nothing if there is an error in the request. Check the console or log for an error message.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
