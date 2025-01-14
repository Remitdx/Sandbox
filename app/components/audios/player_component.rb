module Audios
  class PlayerComponent < ViewComponent::Base
    def initialize(music:)
      @music = music
    end
  end
end
