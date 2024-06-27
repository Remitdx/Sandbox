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

      grid1 = player_turn(@puissance_4, params[:column].to_i)
      # modify array with player's turn
      gameover = win?(grid1) ? 0 : 2
      # check if player wins
      @puissance_4.update(grid: grid1, gameover: gameover)

      redirect_to games_puissance4_path(@puissance_4)
    end

    private

    def valid_play?(puissance_4, column)
      puissance_4.grid[column].include?(0)
    end

    def player_turn(puissance_4, column)
      return [] unless valid_play?(puissance_4, column)

      puissance_4.grid[column][puissance_4.grid[column].index(0)] = 1
      puissance_4.grid
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
