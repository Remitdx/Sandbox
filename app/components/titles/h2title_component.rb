module Titles
  class H2titleComponent < ViewComponent::Base
    def initialize(title:)
      @title = title
    end
  end
end
