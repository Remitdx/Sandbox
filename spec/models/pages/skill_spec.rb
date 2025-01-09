module Pages
  require 'rails_helper'

  RSpec.describe Skill, type: :model do
    describe '#my_skills' do
      subject(:skills) { Skill.new.my_skills }

      it { is_expected.to be_a_kind_of(Array) }
    end
  end
end
