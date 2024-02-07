# frozen_string_literal: true
module Titles
  class H3titleComponent < ViewComponent::Base
    def initialize(title:)
      @title = title
    end
  end
end
