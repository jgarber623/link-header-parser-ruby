# frozen_string_literal: true

RSpec.describe LinkHeaderParser::LinkHeader, "#to_hash" do
  JSON.parse(
    File.read(File.join(Dir.pwd, "spec/support/example_link_headers.json")),
    symbolize_names: true
  ).each do |header, result|
    context "when header is #{header}" do
      it "returns a Hash" do
        expect(described_class.new(header, base: "https://example.com").to_hash).to include(result)
      end
    end
  end

  JSON.parse(
    File.read(File.join(Dir.pwd, "spec/support/example_link_headers_with_anchors.json")),
    symbolize_names: true
  ).each do |header, result|
    context "when header is #{header}" do
      it "returns a Hash" do
        expect(described_class.new(header, base: "https://example.com").to_hash).to include(result)
      end
    end
  end
end
