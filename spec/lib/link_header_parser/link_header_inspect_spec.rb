# frozen_string_literal: true

RSpec.describe LinkHeaderParser::LinkHeader, "#inspect" do
  it "returns a String" do
    regexp = /^#<LinkHeaderParser::LinkHeader:0x[a-f0-9]+ target_uri: ".*", relation_types: \[.*\]>$/

    expect(described_class.new(%(</>; rel="home"), base: "https://example.com").inspect).to match(regexp)
  end
end
