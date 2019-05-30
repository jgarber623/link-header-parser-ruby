describe LinkHeaderParser::ParsedHeaderCollection, :each do
  subject(:parsed_header_set) { described_class.new(headers, base: 'https://example.com') }

  let(:headers) { ['</1>; rel="next"'] }

  context 'when not given a block' do
    it 'returns an Enumerable' do
      expect(parsed_header_set.each).to be_instance_of(Enumerator)
    end
  end

  context 'when given a block' do
    it 'returns the results of the block' do
      results = []

      parsed_header_set.each { |header| results << header.target_uri }

      expect(results).to eq(['https://example.com/1'])
    end
  end
end
