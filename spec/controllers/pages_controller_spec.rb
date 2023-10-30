require 'rails_helper'

RSpec.describe PagesController do
  describe '#home' do
    subject(:home) { get :home }

    it { expect(response.status).to eq(200) }
  end

  describe '#cv' do
    subject(:cv) { get :cv }

    it { expect(response.status).to eq(200) }
  end

  describe '#philosophy' do
    subject(:philosophy) { get :philosophy }

    it { expect(response.status).to eq(200) }
  end

  describe '#projects' do
    subject(:projects) { get :projects }

    it { expect(response.status).to eq(200) }
  end

  describe '#contact' do
    subject(:contact) { get :contact }

    it { expect(response.status).to eq(200) }
  end
end
