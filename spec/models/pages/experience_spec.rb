module Pages
  require 'rails_helper'

  RSpec.describe Experience, type: :model do
    describe '#my_experiences' do
      subject(:experiences) { Experience.new.my_experiences }

      it { is_expected.to be_a_kind_of(Hash) }
    end
  end
end
