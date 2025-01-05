module Games
  class Puissance4 < ApplicationRecord

    def self.new_grid
      [
        [ 0, 0, 0, 0, 0, 0 ],
        [ 0, 0, 0, 0, 0, 0 ],
        [ 0, 0, 0, 0, 0, 0 ],
        [ 0, 0, 0, 0, 0, 0 ],
        [ 0, 0, 0, 0, 0, 0 ],
        [ 0, 0, 0, 0, 0, 0 ],
        [ 0, 0, 0, 0, 0, 0 ]
      ]
    end

    def reset_game
      self.grid = [
        [ 0, 0, 0, 0, 0, 0 ],
        [ 0, 0, 0, 0, 0, 0 ],
        [ 0, 0, 0, 0, 0, 0 ],
        [ 0, 0, 0, 0, 0, 0 ],
        [ 0, 0, 0, 0, 0, 0 ],
        [ 0, 0, 0, 0, 0, 0 ],
        [ 0, 0, 0, 0, 0, 0 ]]
      self.gameover = 2
      self.players = [ "p1", "p2" ]
    end

    def compute_turns(column)
      return [ self.grid, self.gameover, self.players ] unless valid_play?(self, column)

      self.grid = player_turn(self, column)
      gameover_state = end?(grid) ? 1 : 2
      self.gameover = win?(grid) ? 0 : gameover_state
      self.players = self.gameover == 2 ? self.players.rotate : self.players

      self
    end

    def register_last_play(column)
      self.lastplay = [column, self.grid[column].index(0) -1 ]

      self
    end

    private

    def player_turn(puissance_4, column)
      puissance_4.grid[column][puissance_4.grid[column].index(0)] = puissance_4.players.first == "p1" ? 1 : -1
      puissance_4.grid
    end

    def valid_play?(puissance_4, column)
      puissance_4.grid[column].include?(0)
    end

    def win?(grid)
      win = false
      for i in 0..3 # 69 win conditions to check ... :D
        for j in 0..2
          win = true if (grid[i][j] + grid[i+1][j] + grid[i+2][j] + grid[i+3][j]).abs == 4 ||          # bottom line
                        (grid[i][j+3] + grid[i+1][j+3] + grid[i+2][j+3] + grid[i+3][j+3]).abs == 4 ||  # top line
                        (grid[i][j] + grid[i][j+1] + grid[i][j+2] + grid[i][j+3]).abs == 4 ||          # left column
                        (grid[i+3][j] + grid[i+3][j+1] + grid[i+3][j+2] + grid[i+3][j+3]).abs == 4 ||  # right column
                        (grid[i][j] + grid[i+1][j+1] + grid[i+2][j+2] + grid[i+3][j+3]).abs == 4 ||    # diag /
                        (grid[i+3][j] + grid[i+2][j+1] + grid[i+1][j+2] + grid[i][j+3]).abs == 4       # diag \
        end
      end
      win
    end

    def end?(grid)
      return false if grid.flatten.include?(0)

      true
    end
  end
end
