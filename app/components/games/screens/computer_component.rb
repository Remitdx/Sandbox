module Games
  module Screens
    class ComputerComponent < ViewComponent::Base
      def initialize(model:)
        @model = model
      end
    end
  end
end
