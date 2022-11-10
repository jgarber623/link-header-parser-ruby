# frozen_string_literal: true

RSpec.describe LinkHeaderParser, '.parse' do
  let(:base_url) { 'https://example.com' }

  context 'when headers is a list' do
    subject(:parser) { described_class.parse('</>; rel="home"', base: base_url) }

    it 'returns a LinkHeadersCollection' do
      expect(parser).to be_instance_of(LinkHeaderParser::LinkHeadersCollection)
    end
  end

  context 'when headers is an Array' do
    subject(:parser) { described_class.parse(['</>; rel="home"'], base: base_url) }

    it 'returns a LinkHeadersCollection' do
      expect(parser).to be_instance_of(LinkHeaderParser::LinkHeadersCollection)
    end
  end
end
