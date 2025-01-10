module Games
  module Keyboards
    class ArrowsComponent < ViewComponent::Base
      def initialize(controller: {}, actions: {})
        @controller = controller
        @actions = actions
      end
    end
  end
end
