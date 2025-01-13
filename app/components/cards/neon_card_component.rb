module Cards
  class NeonCardComponent < ViewComponent::Base
    def initialize(whatever: {})
      @whatever = whatever
    end
  end
end
