module Games
  module Keyboards
    class ArrowsComponent < ViewComponent::Base
      def initialize(js_controller: {}, actions: {})
        @js_controller = js_controller
        @actions = actions
      end
    end
  end
end
