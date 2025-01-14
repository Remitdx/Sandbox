module Cards
  class RadarCardComponent < ViewComponent::Base
    def initialize(title: {}, classes: {}, categories: {})
      @title = title
      @classes = classes
      @categories = categories
    end
  end
end
