module Games
  class Puissance4sController < ApplicationController
    def create
      puissance_4 = Games::Puissance4.create(grid: [
                                                    [0, 0, 0, 0, 0, 0],
                                                    [0, 0, 0, 0, 0, 0],
                                                    [0, 0, 0, 0, 0, 0],
                                                    [0, 0, 0, 0, 0, 0],
                                                    [0, 0, 0, 0, 0, 0],
                                                    [0, 0, 0, 0, 0, 0],
                                                    [0, 0, 0, 0, 0, 0]
                                                  ],
                                            gameover: 2)
      redirect_to games_puissance4_path(puissance_4)
    end

    def show
      @puissance_4 = Games::Puissance4.find(params[:id])
    end

    def update
      @puissance_4 = Games::Puissance4.find(params[:id])

      if @puissance_4.gameover == 2 || params[:reset]
        computed_score = params[:reset] ? reset_game : compute_turns(@puissance_4, params[:column].to_i)

        @puissance_4.update(grid: computed_score[0], gameover: computed_score[1], players: computed_score[2])
      end

      redirect_to games_puissance4_path(@puissance_4)
    end

    private

    def reset_game
      [
        [
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0]
        ],
        2,
        ['Player 1', 'Player 2']
      ]
    end

    def compute_turns(puissance_4, column)
      grid = player_turn(puissance_4, column)
      gameover = win?(grid) ? 0 : 2
      players = gameover == 2 ? puissance_4.players.rotate : puissance_4.players

      [grid, gameover, players]
    end

    def player_turn(puissance_4, column)
      return [puissance_4.grid] unless valid_play?(puissance_4, column)

      puissance_4.grid[column][puissance_4.grid[column].index(0)] = puissance_4.players.first == 'Player 1' ? 1 : -1
      puissance_4.grid
    end

    def valid_play?(puissance_4, column)
      puissance_4.grid[column].include?(0)
    end

    def win?(grid)
      win = false
      for i in 0..3
        for j in 0..2
          win = true if (grid[i][j] + grid[i+1][j] + grid[i+2][j] + grid[i+3][j]).abs == 4 ||
                        (grid[i][j] + grid[i][j+1] + grid[i][j+2] + grid[i][j+3]).abs == 4 ||
                        (grid[i][j] + grid[i+1][j+1] + grid[i+2][j+2] + grid[i+3][j+3]).abs == 4 ||
                        (grid[i+3][j] + grid[i+2][j+1] + grid[i+1][j+2] + grid[i][j+3]).abs == 4
        end
      end
      win
    end
  end
end
