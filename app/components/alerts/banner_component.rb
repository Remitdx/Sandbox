module Alerts
  class BannerComponent < ViewComponent::Base
    def initialize(title:, text:, classes: {})
      @title = title
      @text = text
      @classes = classes
    end
  end
end
