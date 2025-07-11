module Games
  require 'rails_helper'

  RSpec.describe Puzzle, type: :model do
    describe 'validations' do
      context 'valid puzzle' do
        subject(:valid_puzzle) { Puzzle.new(value: (0...(3 * 3)).to_a, pseudo:"JC", gameover: 2, size: 3) }

        it { is_expected.to be_valid }
      end

      context 'puzzle size too big' do
        subject(:unvalid_puzzle) { Puzzle.new(value: (0...(3 * 3)).to_a, pseudo:"JC", gameover: 2, size: 8) }

        it { is_expected.to_not be_valid }
      end

      context 'puzzle without pseudo' do
        subject(:unvalid_puzzle) { Puzzle.new(value: (0...(3 * 3)).to_a, gameover: 2, size: 5) }

        it { is_expected.to_not be_valid }
      end
    end

    describe 'functions' do
      context '#generate_solvable_shuffle'
      context '#compute_turn'
    end
  end
end
