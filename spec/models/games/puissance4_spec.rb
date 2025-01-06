module Games
  require 'rails_helper'

  RSpec.describe Puissance4, type: :model do
    describe 'validations' do
      context 'valid puissance 4' do
        subject(:valid_p4) { Puissance4.new(grid: Puissance4.new_grid, gameover: 2, players: ['p1', 'p2'])}

        it { is_expected.to be_valid }
      end

      context 'not 7-length grid' do
        subject(:unvalid_p4) { Puissance4.new(grid: Puissance4.new_grid.pop(2), gameover: 2, players: ['p1', 'p2'])}

        it { is_expected.to_not be_valid }
      end

      context 'not 2-length players' do
        subject(:unvalid_p4) { Puissance4.new(grid: Puissance4.new_grid, gameover: 2, players: ['p1'])}

        it { is_expected.to_not be_valid }
      end

      context 'gameover missing' do
        subject(:unvalid_p4) { Puissance4.new(grid: Puissance4.new_grid, gameover: nil, players: ['p1', 'p2'])}

        it { is_expected.to_not be_valid }
      end
    end

    describe '#reset_game' do
      subject(:p4) { Puissance4.new.reset_game }

      it { expect(p4.grid).to be == Puissance4.new_grid }
      it { expect(p4.gameover).to be == 2  }
      it { expect(p4.players).to be == [ "p1", "p2" ] }
    end

    describe '#compute_turns' do
      describe 'not winning turn' do
        context 'valid play' do
          subject(:p4) { Puissance4.new(grid: Puissance4.new_grid, gameover: 2, players: ['p1', 'p2']).compute_turns(4) }

          it { expect(p4.grid[4]).to be == [1, 0, 0, 0, 0, 0] }
          it { expect(p4.grid.flatten.sum).to be == 1 }
          it { expect(p4.gameover).to be == 2 }
          it { expect(p4.players).to be == ['p2', 'p1'] }
        end

        context 'unvalid play' do
          subject(:p4) { Puissance4.new(grid: Puissance4.new_grid.pop(6).unshift([1, -1, 1, 1, -1, 1]), gameover: 2, players: ['p1', 'p2']).compute_turns(0) }

          it { expect(p4.grid[0]).to be == [1, -1, 1, 1, -1, 1] }
          it { expect(p4.grid.flatten.sum).to be == 2 }
          it { expect(p4.gameover).to be == 2 }
          it { expect(p4.players).to be == ['p1', 'p2'] }
        end
      end

      describe 'winning turn' do
        context 'p1 win' do
          subject(:p4) { Puissance4.new(grid: Puissance4.new_grid.pop(6).unshift([1, 1, 1, 0, 0, 0]), gameover: 2, players: ['p1', 'p2']).compute_turns(0) }

          it { expect(p4.grid[0]).to be == [1, 1, 1, 1, 0, 0] }
          it { expect(p4.grid.flatten.sum).to be == 4 }
          it { expect(p4.gameover).to be == 0 }
          it { expect(p4.players).to be == ['p1', 'p2'] }
        end

        context 'tie' do
          subject(:p4) { Puissance4.new(grid: [[1, -1, 1, -1, 1, -1], [1, -1, 1, -1, 1, -1], [1, -1, 1, -1, 1, -1], [-1, 1, -1, 1, -1, 1], [1, -1, 1, -1, 1, -1], [1, -1, 1, -1, 1, -1], [1, -1, 1, -1, 1, 0]], gameover: 2, players: ['p2', 'p1']).compute_turns(6) }

          it { expect(p4.grid[6]).to be == [1, -1, 1, -1, 1, -1] }
          it { expect(p4.grid.flatten.sum).to be == 0 }
          it { expect(p4.gameover).to be == 1 }
          it { expect(p4.players).to be == ['p2', 'p1'] }
        end
      end
    end

    describe '#register_last_play' do
      subject(:p4) { Puissance4.new(grid: Puissance4.new_grid, gameover: 2, players: ['p1', 'p2']).compute_turns(4).register_last_play(4) }

      it { expect(p4.lastplay).to be == [4, 0] }
    end
  end
end
