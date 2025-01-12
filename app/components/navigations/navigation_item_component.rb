module Navigations
  class NavigationItemComponent < ViewComponent::Base
    def initialize(number:, title:, path:)
      @number = number
      @title = title
      @path = path
    end
  end
end
