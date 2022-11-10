# frozen_string_literal: true

RSpec.describe LinkHeaderParser::LinkHeadersCollection, '#to_ary' do
  subject(:link_headers_collection) { described_class.new(headers, base: 'https://example.com') }

  let(:headers) { ['</1>; rel="next"'] }

  it 'returns an Array' do
    results = [
      {
        context_string: '/1',
        context_uri: 'https://example.com/1',
        link_parameters: { rel: ['next'] },
        relation_types: ['next'],
        relations_string: 'next',
        target_string: '/1',
        target_uri: 'https://example.com/1'
      }
    ]

    expect(link_headers_collection.to_ary).to eq(results)
  end
end
