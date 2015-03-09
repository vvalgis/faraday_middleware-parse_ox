require 'spec_helper'

RSpec.describe FaradayMiddleware::ParseOx::Parser do

  let(:response_body) do
    <<-XML.gsub(/^\s{6}/s, '').strip
      <?xml version="1.0" standalone="yes" encoding="utf-8"?>
      <woot>
        <node num="one">first</node>
        <node num="two">second</node>
        <node num="three">third</node>
      </woot>
    XML
  end

  let(:parsed_body) { double("Parsed body") }

  let(:connection) do
    Faraday.new do |builder|
      builder.response :ox
      builder.adapter :test do |stub|
        stub.get('/url') { [200, {}, response_body] }
      end
    end
  end

  subject { connection.get('/url').body }


  describe 'parse response body with ox' do
    let(:options) { {skip: :skip_white, mode: :generic, symbolize_keys: true, encoding: 'utf-8'} }
    it 'should called with options' do
      expect(Ox).to receive(:load).with(response_body, options).and_return(parsed_body)
      connection.get('/url')
    end
    it { expect(subject).to be_a(Ox::Document) }
    it { expect(subject.root).to be_a(Ox::Element) }
    it { expect(subject.root.nodes.count).to eq(3) }
    it { expect(subject.woot.node.text).to eq('first') }
    it { expect(subject.woot.node.num).to eq('one') }
    it { expect(subject.woot.node(2).num).to eq('three') }
  end

end