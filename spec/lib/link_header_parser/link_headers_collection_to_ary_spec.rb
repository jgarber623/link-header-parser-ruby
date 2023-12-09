# frozen_string_literal: true

RSpec.describe LinkHeaderParser::LinkHeadersCollection, "#to_ary" do
  it "returns an Array" do
    expect(
      described_class.new([%(</1>; rel="next")], base: "https://example.com").to_ary
    ).to eq(
      [
        {
          context_string: "/1",
          context_uri: "https://example.com/1",
          link_parameters: { rel: ["next"] },
          relation_types: ["next"],
          relations_string: "next",
          target_string: "/1",
          target_uri: "https://example.com/1"
        }
      ]
    )
  end
end
