# frozen_string_literal: true

RSpec.describe LinkHeaderParser::LinkHeadersCollection, "#group_by_relation_type" do
  it "returns a Hash" do
    expect(
      described_class.new(%(</1>; rel="next"), base: "https://example.com").group_by_relation_type[:next].first
    ).to be_instance_of(LinkHeaderParser::LinkHeader)
  end
end
