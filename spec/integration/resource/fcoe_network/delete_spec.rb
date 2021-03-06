require 'spec_helper'

klass = OneviewSDK::FCoENetwork
RSpec.describe klass, integration: true, type: DELETE, sequence: rseq(klass) do
  include_context 'integration context'

  describe '#delete' do
    it 'deletes the resource' do
      item = OneviewSDK::FCoENetwork.new($client, name: FCOE_NET_NAME)
      item.retrieve!
      item.delete
    end
  end
end
