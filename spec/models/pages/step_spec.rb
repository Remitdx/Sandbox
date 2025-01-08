module Pages
  require 'rails_helper'

  RSpec.describe Step, type: :model do
    describe '#conception_steps' do
      subject(:conception_steps) { Step.new.conception_steps }

      it { is_expected.to be_a_kind_of(Hash)}
    end

    describe '#development_steps' do
      subject(:development_steps) { Step.new.development_steps }

      it { is_expected.to be_a_kind_of(Hash)}
    end

    describe '#maintenance_steps' do
      subject(:maintenance_steps) { Step.new.maintenance_steps }

      it { is_expected.to be_a_kind_of(Hash)}
    end
  end
end
