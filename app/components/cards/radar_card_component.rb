module Cards
  class RadarCardComponent < ViewComponent::Base
    def initialize(classes: {}, categories: {})
      @classes = classes
      @categories = categories
    end
  end
end
