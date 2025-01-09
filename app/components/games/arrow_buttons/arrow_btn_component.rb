module Games
  module ArrowButtons
    class ArrowBtnComponent < ViewComponent::Base
      def initialize(controller: {}, actions: {})
        @controller = controller
        @actions = actions
      end
    end
  end
end
