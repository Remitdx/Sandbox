module Pages
  require 'rails_helper'

  RSpec.describe Education, type: :model do
    describe '#my_education' do
      subject(:education) { Education.new.my_education }

      it { is_expected.to be_a_kind_of(Hash) }
    end
  end
end
