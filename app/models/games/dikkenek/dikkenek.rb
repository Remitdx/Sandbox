module Games
  module Dikkenek
    class Dikkenek < ApplicationRecord
      serialize :quotes, Array
    end
  end
end
