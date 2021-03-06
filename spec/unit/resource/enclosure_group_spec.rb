require 'spec_helper'

RSpec.describe OneviewSDK::EnclosureGroup do
  include_context 'shared context'

  describe '#initialize' do
    context 'OneView 2.0' do
      it 'sets the defaults correctly' do
        item = OneviewSDK::EnclosureGroup.new(@client)
        expect(item[:type]).to eq('EnclosureGroupV200')
      end
    end
  end

  describe '#script' do
    it 'requires a uri' do
      expect { OneviewSDK::EnclosureGroup.new(@client).get_script }.to raise_error(OneviewSDK::IncompleteResource, /Please set uri/)
    end

    it 'gets uri/script' do
      item = OneviewSDK::EnclosureGroup.new(@client, uri: '/rest/fake')
      expect(@client).to receive(:rest_get).with('/rest/fake/script', item.api_version).and_return(FakeResponse.new('Blah'))
      expect(@client.logger).to receive(:warn).with(/Failed to parse JSON response/).and_return(true)
      expect(item.get_script).to eq('Blah')
    end
  end

  describe '#set_script' do
    it 'requires a uri' do
      expect { OneviewSDK::EnclosureGroup.new(@client).set_script('Blah') }.to raise_error(OneviewSDK::IncompleteResource, /Please set uri/)
    end

    it 'does a PUT to uri/script' do
      item = OneviewSDK::EnclosureGroup.new(@client, uri: '/rest/fake')
      expect(@client).to receive(:rest_put).with('/rest/fake/script', { 'body' => 'Blah' }, item.api_version).and_return(FakeResponse.new('Blah'))
      expect(@client.logger).to receive(:warn).with(/Failed to parse JSON response/).and_return(true)
      expect(item.set_script('Blah')).to eq(true)
    end
  end
end
