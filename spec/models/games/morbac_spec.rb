module Games
  require 'rails_helper'

  RSpec.describe Morbac, type: :model do

    describe 'validations' do
      context 'valid morbac' do
        subject(:valid_morbac) { Morbac.new(value: [ 5, 5, 0, 5, 5, 1, 5, 5, 5 ], gameover: 2)}

        it { is_expected.to be_valid }
      end

      context 'not 9-length value' do
        subject(:unvalid_morbac) { Morbac.new(value: [ 5, 5, 0, 5, 5, 1 ], gameover: 2)}

        it { is_expected.to_not be_valid }
      end

      context 'gameover missing' do
        subject(:unvalid_morbac) { Morbac.new(value: [ 5, 5, 0, 5, 5, 1, 5, 5, 5 ], gameover: nil)}

        it { is_expected.to_not be_valid }
      end
    end

    describe '#reset_game' do
      morbac = Morbac.new.reset_game
      it { expect(morbac.value).to be == [ 5, 5, 5, 5, 5, 5, 5, 5, 5 ] }
      it { expect(morbac.gameover).to be == 2  }
    end

    describe '#compute_turns' do
      describe 'nobody can win' do
        context 'valid play' do
          subject(:valid_morbac) { Morbac.new(value: [ 5, 5, 0, 5, 5, 1, 5, 5, 5 ], gameover: 2).compute_turns(8) }

          it { expect(valid_morbac.value[8]).to be == 0 }
          it { expect(valid_morbac.gameover).to be == 2 }
          it { expect(valid_morbac.lastplay).to be >= 0 }
          it { expect(valid_morbac.lastplay).to be <= 8 }
          it { expect(valid_morbac.lastplay).not_to be == 2 }
          it { expect(valid_morbac.lastplay).not_to be == 5 }
        end

        context 'unvalid play' do
          subject(:unvalid_morbac) { Morbac.new(value: [ 5, 5, 0, 5, 5, 1, 5, 5, 5 ], gameover: 2).compute_turns(5) }

          it { expect(unvalid_morbac.value).to be == [ 5, 5, 0, 5, 5, 1, 5, 5, 5 ] }
          it { expect(unvalid_morbac.gameover).to be == 2 }
          it { expect(unvalid_morbac.lastplay).to be_nil }
        end
      end

      describe 'player or AI can win' do
        context 'player win' do
          subject(:morbac) { Morbac.new(value: [ 0, 5, 0, 5, 5, 5, 5, 1, 1 ], gameover: 2).compute_turns(1) }

          it { expect(morbac.value).to be == [ 0, 0, 0, 5, 5, 5, 5, 1, 1 ] }
          it { expect(morbac.gameover).to be == 0 }
          it { expect(morbac.lastplay).to be_nil }
        end

        context 'AI win' do
          subject(:morbac) { Morbac.new(value: [ 0, 5, 0, 5, 5, 5, 5, 1, 1 ], gameover: 2).compute_turns(4) }

          it { expect(morbac.value).to be == [ 0, 5, 0, 5, 0, 5, 1, 1, 1 ] }
          it { expect(morbac.gameover).to be == 1 }
          it { expect(morbac.lastplay).to be == 6 }
        end
      end
      describe 'Tie' do
        subject(:morbac) { Morbac.new(value: [ 0, 1, 1, 1, 0, 0, 0, 5, 1 ], gameover: 2).compute_turns(7) }

        it { expect(morbac.value).to be == [ 0, 1, 1, 1, 0, 0, 0, 0, 1 ] }
        it { expect(morbac.gameover).to be == 2 }
        it { expect(morbac.lastplay).to be_nil }
      end
    end
  end
end
