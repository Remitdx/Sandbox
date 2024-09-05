module Games
  class MorbacsController < ApplicationController
    def create
      morbac = Games::Morbac.create()
      redirect_to games_morbac_path(morbac)
    end

    def show
      @morbac = Games::Morbac.find(params[:id])
    end

    def update
      @morbac = Games::Morbac.find(params[:id])

      if @morbac.gameover == 2 || params[:reset]
        computed_score = params[:reset] ? reset_game : compute_turns(@morbac, params[:pos].to_i)
        @morbac.update(value: computed_score[0], gameover: computed_score[1])
      end

      redirect_to games_morbac_path(@morbac)
    end

    private

    def reset_game
      [ [ 5, 5, 5, 5, 5, 5, 5, 5, 5 ], 2 ]
    end

    def compute_turns(morbac, index) # return [value, gameover]
      array1 = player_turn(morbac, index)
      return [ morbac.value, morbac.gameover ] if array1 == []

      array2 = player_win?(array1) ? array1 : ai_turn(array1)
      gameover = ai_win?(array2) ? 1 : 2
      gameover = player_win?(array2) ? 0 : gameover

      [ array2, gameover ]
    end

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
