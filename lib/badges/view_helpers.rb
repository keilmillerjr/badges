require 'markaby'

module Badges
  module ViewHelpers
    def list_badges(obj, options={})   
      # Code School
         
      # badges
      if !options[:codeschool_badges].blank? && !obj.badges.blank?
        html = Markaby::Builder.new
        
        html.send :ul, ({id: options[:id]} if options[:id]), ({class: options[:class]} if options[:class]) do
          obj.badges.each do |course|
            li do
              if options[:codeschool_badges][:link]
                a href: course['url'] do
                  img src: course['badge'] if options[:codeschool_badges][:image]
                  span course['name'] if options[:codeschool_badges][:text]
                end
              else
                img src: course['badge'] if options[:codeschool_badges][:image]
                span course['name'] if options[:codeschool_badges][:text]
              end
            end
          end
        end
        
        return html.to_s.html_safe
      end
      
      # courses completed
      if !options[:codeschool_courses_completed].blank? && !obj.courses_completed.blank?
        html = Markaby::Builder.new
        
        html.send :ul, ({id: options[:id]} if options[:id]), ({class: options[:class]} if options[:class]) do
          obj.courses_completed.each do |course|
            li do
              if options[:codeschool_courses_completed][:link]
                a href: course['url'] do
                  img src: course['badge'] if options[:codeschool_courses_completed][:image]
                  span course['title'] if options[:codeschool_courses_completed][:text]
                end
              else
                img src: course['badge'] if options[:codeschool_courses_completed][:image]
                span course['title'] if options[:codeschool_courses_completed][:text]
              end
            end
          end
        end
        
        return html.to_s.html_safe
      end
      
      # courses in progress
      if !options[:codeschool_courses_in_progress].blank? && !obj.courses_in_progress.blank?
        html = Markaby::Builder.new
        
        html.send :ul, ({id: options[:id]} if options[:id]), ({class: options[:class]} if options[:class]) do
          obj.courses_in_progress.each do |course|
            li do
              if options[:codeschool_courses_in_progress][:link]
                a href: course['url'] do
                  img src: course['badge'] if options[:codeschool_courses_in_progress][:image]
                  span course['title'] if options[:codeschool_courses_in_progress][:text]
                end
              else
                img src: course['badge'] if options[:codeschool_courses_in_progress][:image]
                span course['title'] if options[:codeschool_courses_in_progress][:text]
              end
            end
          end
        end
        
        return html.to_s.html_safe
      end
      
      # Treehouse
      
      # badges
      if !options[:treehouse_badges].blank? && !obj.badges.blank?
        html = Markaby::Builder.new
        
        html.send :ul, ({id: options[:id]} if options[:id]), ({class: options[:class]} if options[:class]) do
          obj.badges.each do |course|
            li do
              if options[:treehouse_badges][:link]
                a href: course['url'] do
                  img src: course['icon_url'] if options[:treehouse_badges][:image]
                  span course['name'] if options[:treehouse_badges][:text]
                end
              else
                img src: course['icon_url'] if options[:treehouse_badges][:image]
                span course['name'] if options[:treehouse_badges][:text]
              end
            end
          end
        end
        
        return html.to_s.html_safe
      end
    end
  end
end
