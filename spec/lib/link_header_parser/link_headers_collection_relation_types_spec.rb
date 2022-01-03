# frozen_string_literal: true

describe LinkHeaderParser::LinkHeadersCollection, '#relation_types' do
  subject(:link_headers_collection) { described_class.new(headers, base: 'https://example.com') }

  let(:headers) { ['</1>; rel="next", </2>; rel="next", </3>; rel="next"'] }

  it 'returns an Array' do
    expect(link_headers_collection.relation_types).to eq(['next'])
  end
end
