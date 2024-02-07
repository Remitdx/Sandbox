module Titles
  class H1titleComponent < ViewComponent::Base
    def initialize(title:)
      @title = title
    end
  end
end
