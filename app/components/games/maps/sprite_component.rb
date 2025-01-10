module Games
  module Maps
    class SpriteComponent < ViewComponent::Base
      def initialize(type:, x:, y:, model: {})
        @type = type
        @x = x
        @y = y
        @model = model
      end
    end
  end
end
