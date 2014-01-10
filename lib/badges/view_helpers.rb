require 'markaby'

module Badges
  module ViewHelpers
    # codeschool
    def codeschool(user_id, options={})
      codeschool = Badges::CodeSchool.new(user_id)
      
      # avatar
      if options[:avatar] && !codeschool.avatar_url.blank?
        html = Markaby::Builder.new
        
        html.send :img, {src: codeschool.avatar_url}, ({id: options[:avatar][:id]} if options[:avatar][:id]), ({class: options[:avatar][:class]} if options[:avatar][:class])
        
        return html.to_s.html_safe
      end
      
      # badges
      if !options[:badges].blank? && !codeschool.badges.blank?
        html = Markaby::Builder.new
        
        html.send :ul, ({id: options[:badges][:id]} if options[:badges][:id]), ({class: options[:badges][:class]} if options[:badges][:class]) do
          codeschool.badges.each do |course|
            li do
              if options[:badges][:link]
                tag! :a, href: course['url'] do
                  tag! :img, src: course['badge'] if options[:badges][:image]
                  text course['name'] if options[:badges][:text]
                end
              else
                tag! :img, src: course['badge'] if options[:badges][:image]
                text course['name'] if options[:badges][:text]
              end
            end
          end
        end
        
        return html.to_s.html_safe
      end
      
      # courses completed
      if !options[:courses_completed].blank? && !codeschool.courses_completed.blank?
        html = Markaby::Builder.new
        
        html.send :ul, ({id: options[:courses_completed][:id]} if options[:courses_completed][:id]), ({class: options[:courses_completed][:class]} if options[:courses_completed][:class]) do
          codeschool.courses_completed.each do |course|
            li do
              if options[:courses_completed][:link]
                tag! :a, href: course['url'] do
                  tag! :img, src: course['badge'] if options[:courses_completed][:image]
                  text course['title'] if options[:courses_completed][:text]
                end
              else
                tag! :img, src: course['badge'] if options[:courses_completed][:image]
                text course['title'] if options[:courses_completed][:text]
              end
            end
          end
        end
        
        return html.to_s.html_safe
      end
      
      # courses_in_progress
      if !options[:courses_in_progress].blank? && !codeschool.courses_in_progress.blank?
        html = Markaby::Builder.new
        
        html.send :ul, ({id: options[:courses_in_progress][:id]} if options[:courses_in_progress][:id]), ({class: options[:courses_in_progress][:class]} if options[:courses_in_progress][:class]) do
          codeschool.courses_in_progress.each do |course|
            li do
              if options[:courses_in_progress][:link]
                tag! :a, href: course['url'] do
                  tag! :img, src: course['badge'] if options[:courses_in_progress][:image]
                  text course['title'] if options[:courses_in_progress][:text]
                end
              else
                tag! :img, src: course['badge'] if options[:courses_in_progress][:image]
                text course['title'] if options[:courses_in_progress][:text]
              end
            end
          end
        end
        
        return html.to_s.html_safe
      end
    end
    
    # treehouse
    def treehouse(user_id, options={})
      treehouse = Badges::Treehouse.new(user_id)
            
      # badges
      if !options[:badges].blank? && !treehouse.badges.blank?
        html = Markaby::Builder.new
        
        html.send :ul, ({id: options[:badges][:id]} if options[:badges][:id]), ({class: options[:badges][:class]} if options[:badges][:class]) do
          treehouse.badges.each do |course|
            li do
              if options[:badges][:link]
                tag! :a, href: course['url'] do
                  tag! :img, src: course['icon_url'] if options[:badges][:image]
                  text course['name'] if options[:badges][:text]
                end
              else
                tag! :img, src: course['icon_url'] if options[:badges][:image]
                text course['name'] if options[:badges][:text]
              end
            end
          end
        end
        
        return html.to_s.html_safe
      end
    end
  end
end
