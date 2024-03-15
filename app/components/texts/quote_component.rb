module Texts
  class QuoteComponent < ViewComponent::Base
    def initialize(quote:, author: nil)
      @quote = quote
      @author = author.upcase if author.is_a?(String)
    end
  end
end
