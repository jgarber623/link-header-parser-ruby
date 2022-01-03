# frozen_string_literal: true

describe LinkHeaderParser::LinkHeader, '#to_hash' do
  SpecFixtures.example_link_headers.each do |header, result|
    context "when header is #{header}" do
      subject(:link_header) { described_class.new(header, base: 'https://example.com') }

      it 'returns a Hash' do
        expect(link_header.to_hash).to include(result)
      end
    end
  end
end
