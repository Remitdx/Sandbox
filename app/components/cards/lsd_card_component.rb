module Cards
  class LsdCardComponent < ViewComponent::Base
    def initialize(whatever: {})
      @whatever = whatever
    end

    def render?
      true # or false
    end
  end
end
