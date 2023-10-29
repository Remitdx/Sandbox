require 'rails_helper'

RSpec.describe PagesController do
  describe '#home' do
    subject(:home) { get :home }

    before { :home }

    it { is_expected.to have_http_statut(:found) }
    it { expect().to render(banner) }
    it { expect().to render(navigation) }
    it { expect().to render(footer) }
    it { expect(age).to be within(30..77) }
  end
end
