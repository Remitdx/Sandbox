module Games
  module Maps
    class SpriteComponent < ViewComponent::Base
      def initialize(type:)
        @type = type
      end
    end
  end
end
