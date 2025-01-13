module Cards
  class LsdCardComponent < ViewComponent::Base
    def initialize(whatever: {})
      @whatever = whatever
    end
  end
end
