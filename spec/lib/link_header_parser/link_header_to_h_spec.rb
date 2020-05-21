describe LinkHeaderParser::LinkHeader, '#to_h' do
  ExampleLinkHeaders::EXAMPLE_LINK_HEADERS.each do |header, result|
    context "when header is #{header}" do
      subject(:link_header) { described_class.new(header, base: 'https://example.com') }

      it 'returns a Hash' do
        expect(link_header.to_h).to include(result)
      end
    end
  end
end
