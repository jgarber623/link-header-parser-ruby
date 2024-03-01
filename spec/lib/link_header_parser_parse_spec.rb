# frozen_string_literal: true

RSpec.describe LinkHeaderParser, ".parse" do
  context "when headers is a list" do
    it "returns a LinkHeadersCollection" do
      expect(
        described_class.parse(%(</>; rel="home"), %(</next>; rel="next"), base: "https://example.com")
      ).to be_instance_of(described_class::LinkHeadersCollection)
    end
  end

  context "when headers is an Array" do
    it "returns a LinkHeadersCollection" do
      expect(
        described_class.parse([%(</>; rel="home"), %(</prev>; rel="prev")], base: "https://example.com")
      ).to be_instance_of(described_class::LinkHeadersCollection)
    end
  end
end
