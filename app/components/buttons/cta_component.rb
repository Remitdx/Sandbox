module Buttons
  class CtaComponent < ViewComponent::Base
    def initialize(title:, classes: {})
      @title = title
      @classes = classes
    end
  end
end
