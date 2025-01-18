module Cards
  class DialogCardComponent < ViewComponent::Base
    def initialize(text: {}, classes: {}, speaker: {})
      @text = text
      @classes = classes
      @speaker = speaker
    end

    def render?
      @text.present? || content
    end
  end
end
