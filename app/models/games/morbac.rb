module Games
  class Morbac < ApplicationRecord

    def reset_game
      self.value = [ 5, 5, 5, 5, 5, 5, 5, 5, 5 ]
      self.gameover = 2
      self
    end

    def compute_turns(index) # return self modified
      array = player_turn(self, index)
      return self if array == []

      self.value = player_win?(array) ? array : ai_turn(array)
      gameover = ai_win?(self.value) ? 1 : 2
      self.gameover = player_win?(self.value) ? 0 : gameover
      self
    end

    private

    def player_turn(morbac, index) # return array modified or []
      return [] if morbac.value[index] < 2

      morbac.value[index] = 0
      morbac.value
    end

    def player_win?(array) # return true or false
      array[0] + array[1] + array[2] == 0 ||
      array[3] + array[4] + array[5] == 0 ||
      array[6] + array[7] + array[8] == 0 ||
      array[0] + array[3] + array[6] == 0 ||
      array[1] + array[4] + array[7] == 0 ||
      array[2] + array[5] + array[8] == 0 ||
      array[0] + array[4] + array[8] == 0 ||
      array[2] + array[4] + array[6] == 0
    end

    def ai_turn(array) # return array modified
    possible_plays = array.each_index.select { |index| array[index] == 5 }
    return array if possible_plays == []

    play = possible_plays.shuffle.first # dumb AI picking random available spot

    array[play] = 1
    array
    end

    def ai_win?(array) # return true or false
      array[0] + array[1] + array[2] == 3 ||
      array[3] + array[4] + array[5] == 3 ||
      array[6] + array[7] + array[8] == 3 ||
      array[0] + array[3] + array[6] == 3 ||
      array[1] + array[4] + array[7] == 3 ||
      array[2] + array[5] + array[8] == 3 ||
      array[0] + array[4] + array[8] == 3 ||
      array[2] + array[4] + array[6] == 3
    end
  end
end
