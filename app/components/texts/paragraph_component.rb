module Texts
  class ParagraphComponent < ViewComponent::Base
    def initialize(text:)
      @text = text
    end
  end
end
