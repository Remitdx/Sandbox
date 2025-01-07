module Games
  require 'rails_helper'

  RSpec.describe Dikkenek, type: :model do
    describe 'validations' do
      context 'valid dikkenek' do
        subject(:dikkenek) { Dikkenek.new(gameover: 2, pseudo: 'Jeanluc', difficulty: 2.4).pick_10_quotes }

        it { is_expected.to be_valid }
      end

      context 'pseudo missing' do
        subject(:dikkenek) { Dikkenek.new(gameover: 2, pseudo: nil, difficulty: 2.4).pick_10_quotes }

        it { is_expected.to_not be_valid }
      end

      context 'gameover missing' do
        subject(:dikkenek) { Dikkenek.new(gameover: nil, pseudo: 'Jeanluc', difficulty: 2.4).pick_10_quotes }

        it { is_expected.to_not be_valid }
      end

      context 'difficulty missing' do
        subject(:dikkenek) { Dikkenek.new(gameover: 2, pseudo: 'Jeanluc', difficulty: nil).pick_10_quotes }

        it { is_expected.to_not be_valid }
      end

      context 'quotes missing' do
        subject(:dikkenek) { Dikkenek.new(quotes: nil, gameover: 2, pseudo: 'Jeanluc', difficulty: 2.4) }

        it { is_expected.to_not be_valid }
      end

      context 'gameover not valid' do
        subject(:dikkenek) { Dikkenek.new(gameover: 7, pseudo: 'Jeanluc', difficulty: 2.4).pick_10_quotes }

        it { is_expected.to_not be_valid }
      end

      context 'good_answers not valid' do
        subject(:dikkenek) { Dikkenek.new(gameover: 7, pseudo: 'Jeanluc', difficulty: 2.4, good_answers: 12).pick_10_quotes }

        it { is_expected.to_not be_valid }
      end

      context 'difficulty not valid' do
        subject(:dikkenek) { Dikkenek.new(gameover: 7, pseudo: 'Jeanluc', difficulty: 6.3).pick_10_quotes }

        it { is_expected.to_not be_valid }
      end

      context 'accuracy not valid' do
        subject(:dikkenek) { Dikkenek.new(gameover: 7, pseudo: 'Jeanluc', difficulty: 2.4, accuracy: 140.9).pick_10_quotes }

        it { is_expected.to_not be_valid }
      end
    end

    describe '#pick_10_quotes' do
      subject(:dikkenek) { Dikkenek.new.pick_10_quotes }

      it { expect(dikkenek.quotes.length).to be == 10 }
    end

    describe '#average_difficulty' do
      context 'with 10 quotes' do
        subject(:dikkenek) { Dikkenek.new.pick_10_quotes.average_difficulty }

        it { expect(dikkenek.difficulty).to be <= 5 }
        it { expect(dikkenek.difficulty).to be >= 1 }
      end

      context 'without 10 quotes' do
        subject(:dikkenek) { Dikkenek.new.average_difficulty }

        it { expect(dikkenek.difficulty).to be_nil }
      end
    end

    describe '#end_game' do
      let(:params) { {:"characters-1" => "Claudy", "scene-1" => "152", :"characters-2" => "Sylvie", "scene-2" => "349",
                      :"characters-3" => "Greg", "scene-3" => "45", :"characters-4" => "Sylvie", "scene-4" => "381",
                      :"characters-5" => "Claudy", "scene-5" => "495", :"characters-6" => "Sylvie", "scene-6" => "39",
                      :"characters-7" => "Aziz", "scene-7" => "304", :"characters-8" => "Aziz", "scene-8" => "304",
                      :"characters-9" => "Aziz", "scene-9" => "304", :"characters-10" => "Aziz", "scene-10" => "304",
                      :start_at => "1736236610122", :submit_at => "1736236660698"}
                    }

      subject(:dikkenek) { Dikkenek.new(gameover: 2).pick_10_quotes.average_difficulty.end_game(params) }

      it { expect(dikkenek.answers).to_not be_blank }
      it { expect(dikkenek.score).to be >= 0 }
      it { expect(dikkenek.accuracy).to be <= 100 }
      it { expect(dikkenek.accuracy).to be >= 0 }
      it { expect(dikkenek.good_answers).to be <= 10 }
      it { expect(dikkenek.good_answers).to be >= 0 }
    end
  end
end
