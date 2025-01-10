module Games
  module Maps
    class SpriteComponent < ViewComponent::Base
      def initialize(type:, x:, y:)
        @type = type
        @x = x
        @y = y
      end
    end
  end
end
