module Games
  module Maps
    class MapComponent < ViewComponent::Base
      def initialize(model:)
        @model = model
      end
    end
  end
end
