describe LinkHeaderParser::LinkHeaderParameter, '#inspect' do
  subject(:link_parameter) { described_class.new('rel="home"') }

  it 'returns a String' do
    expect(link_parameter.inspect).to match(/^#<LinkHeaderParser::LinkHeaderParameter:0x[a-f0-9]+ name: \".*\", value: \".*\">$/)
  end
end
