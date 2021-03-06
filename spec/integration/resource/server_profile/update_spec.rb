require 'spec_helper'

RSpec.describe OneviewSDK::ServerProfile, integration: true, type: UPDATE do
  include_context 'integration context'

  before :all do
    @item = OneviewSDK::ServerProfile.new($client, name: SERVER_PROFILE_NAME)
    @item.retrieve!
    @enclosure_group = OneviewSDK::EnclosureGroup.find_by($client, {}).first
    @server_hardware_type = OneviewSDK::ServerHardwareType.find_by($client, {}).first
    @storage_system = OneviewSDK::StorageSystem.find_by($client, {}).first
    @item3 = OneviewSDK::ServerProfile.new($client, name: SERVER_PROFILE3_NAME)
    @item3.retrieve!
  end

  describe '#self.get_available_networks' do
    it 'retrieves available networks without errors' do
      query_options = {
        'enclosure_group' => @enclosure_group,
        'server_hardware_type' => @server_hardware_type
      }
      expect { OneviewSDK::ServerProfile.get_available_networks($client, query_options) }.to_not raise_error
    end
  end

  describe '#self.get_available_servers' do
    it 'retrieves available servers without errors' do
      expect { OneviewSDK::ServerProfile.get_available_servers($client) }.to_not raise_error
    end
  end

  describe '#self.get_available_storage_system' do
    it 'retrieves available storage system without errors. FAIL: Bug in OneView/Documentation' do
      query_options = {
        'enclosure_group' => @enclosure_group,
        'server_hardware_type' => @server_hardware_type,
        'storage_system' => @storage_system
      }
      expect { OneviewSDK::ServerProfile.get_available_storage_system($client, query_options) }.to_not raise_error
    end
  end

  describe '#self.get_available_storage_systems' do
    it 'retrieves available storage systems without errors' do
      query_options = {
        'enclosure_group' => @enclosure_group,
        'server_hardware_type' => @server_hardware_type
      }
      expect { OneviewSDK::ServerProfile.get_available_storage_systems($client, query_options) }.to_not raise_error
    end
  end

  describe '#self.get_available_targets' do
    it 'retrieves available targets without errors' do
      expect { OneviewSDK::ServerProfile.get_available_targets($client) }.to_not raise_error
    end
  end

  describe '#self.get_profile_ports' do
    it 'retrieves profile ports without errors' do
      query_options = {
        'enclosure_group' => @enclosure_group,
        'server_hardware_type' => @server_hardware_type
      }
      expect { OneviewSDK::ServerProfile.get_profile_ports($client, query_options) }.to_not raise_error
    end
  end

  describe '#get_messages' do
    it 'shows messages' do
      expect { @item.get_messages }.to_not raise_error
    end
  end

  describe '#get_transformation' do
    it 'transforms an existing profile' do
      expect { @item.get_transformation('server_hardware_type' => @server_hardware_type) }.to_not raise_error
    end
  end

  describe '#get_compliance_preview' do
    it 'shows compliance preview' do
      expect { @item3.get_compliance_preview }.to_not raise_error
    end
  end

  describe '#update_from_template' do
    it 'makes the Server Profile compliant with the template' do
      expect { @item3.update_from_template }.to_not raise_error
    end
  end

  describe '#get_available_networks' do
    it 'Gets available networks' do
      item = OneviewSDK::ServerProfile.find_by($client, name: SERVER_PROFILE_NAME).first
      expect { item.get_available_networks }.not_to raise_error
    end
  end

end
