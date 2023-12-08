# frozen_string_literal: true

RSpec.describe LinkHeaderParser::LinkHeaderParameter, "#inspect" do
  it "returns a String" do
    regexp = /^#<LinkHeaderParser::LinkHeaderParameter:0x[a-f0-9]+ name: ".*", value: ".*">$/

    expect(described_class.new(%(rel="home")).inspect).to match(regexp)
  end
end
