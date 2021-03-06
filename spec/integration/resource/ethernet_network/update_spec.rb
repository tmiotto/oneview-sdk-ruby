require 'spec_helper'

RSpec.describe OneviewSDK::EthernetNetwork, integration: true, type: UPDATE do
  include_context 'integration context'

  describe '#update' do
    it 'update name' do
      item = OneviewSDK::EthernetNetwork.new($client, name: ETH_NET_NAME)
      item.retrieve!
      item.update(name: ETH_NET_NAME_UPDATED)
      item.refresh
      expect(item[:name]).to eq(ETH_NET_NAME_UPDATED)
      item.update(name: ETH_NET_NAME)
      item.refresh
      expect(item[:name]).to eq(ETH_NET_NAME)
    end
  end
end
