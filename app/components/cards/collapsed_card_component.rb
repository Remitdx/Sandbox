module Cards
  class CollapsedCardComponent < ViewComponent::Base
    def initialize(classes: {}, title: {}, subtitle: {}, info: {}, description: {})
      @classes = classes
      @title = title
      @subtitle = subtitle
      @info = info
      @description = description
    end
  end
end
