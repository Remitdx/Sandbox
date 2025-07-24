require 'rails_helper'

RSpec.describe Analytic, type: :model do
  describe 'validations' do
    context 'valid analytics' do
      subject(:analytic) { Analytic.new(pages_download_pdf: 3, pages_home: 186, pages_uikit: 5) }

      it { is_expected.to be_valid }
    end

    context 'unvalid analytics' do
      subject(:analytic) { Analytic.new(pages_download_pdf: "cinquante", pages_home: 186, pages_uikit: 5) }

      it { is_expected.to_not be_valid }
    end
  end
end
