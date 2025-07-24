require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe 'validations' do
    context 'valid contacts' do
      subject(:contact) { Contact.new(name: "John", surname: "Doe", email: "one@two.com", message: "Did u met Chuck Norris?") }

      it { is_expected.to be_valid }
    end

    context 'missing name' do
      subject(:contact) { Contact.new(surname: "Doe", email: "one@two.com", message: "Did u met Chuck Norris?") }

      it { is_expected.to_not be_valid }
    end

    context 'missing surname' do
      subject(:contact) { Contact.new(name: "John", email: "one@two.com", message: "Did u met Chuck Norris?") }

      it { is_expected.to_not be_valid }
    end

    context 'missing email' do
      subject(:contact) { Contact.new(name: "John", surname: "Doe", message: "Did u met Chuck Norris?") }

      it { is_expected.to_not be_valid }
    end

    context 'missing message' do
      subject(:contact) { Contact.new(name: "John", surname: "Doe", email: "one@two.com") }

      it { is_expected.to_not be_valid }
    end
  end
end
