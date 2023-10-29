describe '#home' do
  it { expect().to render(home) }
  it { expect().to render(banner) }
  it { expect().to render(navigation) }
  it { expect().to render(footer) }
  it { expect(age).to be within(30..77) }
end
