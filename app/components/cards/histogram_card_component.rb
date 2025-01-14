module Cards
  class HistogramCardComponent < ViewComponent::Base
    def initialize(classes: {}, categories: {})
      @classes = classes
      @categories = categories
    end
  end
end
