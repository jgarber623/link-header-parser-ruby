# frozen_string_literal: true

RSpec.describe LinkHeaderParser, ".parse" do
  context "when headers is a list" do
    it "returns a LinkHeadersCollection" do
      expect(
        described_class.parse(%(</>; rel="home"), base: "https://example.com")
      ).to be_instance_of(LinkHeaderParser::LinkHeadersCollection)
    end
  end

  context "when headers is an Array" do
    it "returns a LinkHeadersCollection" do
      expect(
        described_class.parse([%(</>; rel="home")], base: "https://example.com")
      ).to be_instance_of(LinkHeaderParser::LinkHeadersCollection)
    end
  end
end
