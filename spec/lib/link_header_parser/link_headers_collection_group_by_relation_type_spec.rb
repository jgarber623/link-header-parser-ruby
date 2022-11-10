# frozen_string_literal: true

RSpec.describe LinkHeaderParser::LinkHeadersCollection, '#group_by_relation_type' do
  subject(:link_headers_collection) { described_class.new(headers, base: 'https://example.com') }

  let(:headers) { '</1>; rel="next"' }

  it 'returns a Hash' do
    expect(link_headers_collection.group_by_relation_type[:next].first).to be_instance_of(LinkHeaderParser::LinkHeader)
  end
end
