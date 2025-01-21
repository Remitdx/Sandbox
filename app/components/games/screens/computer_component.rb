module Games
  module Screens
    class ComputerComponent < ViewComponent::Base
      def initialize(model:)
        @model = model
      end

      def render?
        !Games::Escapes::Constants::COMPUTERS[@model.computer].empty?
      end
    end
  end
end
