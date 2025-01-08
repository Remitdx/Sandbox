module Pages
  require 'rails_helper'

  RSpec.describe Hobby, type: :model do
    describe '#my_hobbies' do
      subject(:hobbies) { Hobby.new.my_hobbies }

      it { is_expected.to be_a_kind_of(Hash)}
    end
  end
end
