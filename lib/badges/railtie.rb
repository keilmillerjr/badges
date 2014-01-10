require 'badges/view_helpers'

module Badges
  class Railtie < Rails::Railtie
    initializer 'badges.view_helpers' do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end
