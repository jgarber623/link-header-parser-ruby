# frozen_string_literal: true

RSpec.describe LinkHeaderParser::LinkHeader do
  context "when header is not a String" do
    it "raises a NoMethodError" do
      expect { described_class.new(1, base: "https://example.com") }.to raise_error(NoMethodError)
    end
  end

  context "when base is not a String" do
    it "raises a NoMethodError" do
      expect { described_class.new(%(</>; rel="home"), base: 1) }.to raise_error(NoMethodError)
    end
  end
end
