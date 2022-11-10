# frozen_string_literal: true

RSpec.describe LinkHeaderParser::LinkHeaderParameter, '#inspect' do
  subject(:link_parameter) { described_class.new('rel="home"') }

  it 'returns a String' do
    regexp = /^#<LinkHeaderParser::LinkHeaderParameter:0x[a-f0-9]+ name: ".*", value: ".*">$/

    expect(link_parameter.inspect).to match(regexp)
  end
end
