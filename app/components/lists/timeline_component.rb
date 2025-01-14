module Lists
  class TimelineComponent < ViewComponent::Base
    def initialize(list: {}, card: {}, classes: {})
      @list = list
      @classes = classes
      @card = card
    end
  end
end
