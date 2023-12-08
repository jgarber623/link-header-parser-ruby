# frozen_string_literal: true

RSpec.describe LinkHeaderParser::LinkHeadersCollection, "#relation_types" do
  it "returns an Array" do
    expect(
      described_class
        .new([%(</1>; rel="next", </2>; rel="next", </3>; rel="next")], base: "https://example.com")
        .relation_types
    ).to eq(["next"])
  end
end
