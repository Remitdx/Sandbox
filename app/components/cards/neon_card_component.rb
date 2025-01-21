module Cards
  class NeonCardComponent < ViewComponent::Base
    def initialize(whatever: {}, classes: {})
      @whatever = whatever
      @classes = classes
    end
  end
end
