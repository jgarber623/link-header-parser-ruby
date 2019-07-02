describe LinkHeaderParser::ParsedHeader, '#context' do
  ExampleLinkHeaders::EXAMPLE_LINK_HEADERS_WITH_ANCHORS.each do |header, result|
    context "when header is #{header}" do
      subject(:parsed_header) { described_class.new(header, base: 'https://example.com') }

      it 'returns a Hash' do
        expect(parsed_header.to_h).to include(result)
      end
    end
  end
end
