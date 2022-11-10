# frozen_string_literal: true

RSpec.describe LinkHeaderParser::LinkHeader, '#to_hash' do
  JSON.parse(
    File.read(File.join(Dir.pwd, 'spec/support/example_link_headers.json')),
    symbolize_names: true
  ).each do |header, result|
    context "when header is #{header}" do
      subject(:link_header) { described_class.new(header, base: 'https://example.com') }

      it 'returns a Hash' do
        expect(link_header.to_hash).to include(result)
      end
    end
  end

  JSON.parse(
    File.read(File.join(Dir.pwd, 'spec/support/example_link_headers_with_anchors.json')),
    symbolize_names: true
  ).each do |header, result|
    context "when header is #{header}" do
      subject(:link_header) { described_class.new(header, base: 'https://example.com') }

      it 'returns a Hash' do
        expect(link_header.to_hash).to include(result)
      end
    end
  end
end
