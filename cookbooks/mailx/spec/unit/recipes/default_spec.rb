require 'spec_helper'

describe 'mailx::default' do
  context 'on Ubuntu' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(:platform => 'ubuntu', :version => '14.04')
      runner.converge(described_recipe)
    end

    it 'should install the correct packages' do
      expect(chef_run).to install_package('mailutils')
    end
  end
  
  context 'on CentOS' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(:platform => 'centos', :version => '6.5')
      runner.converge(described_recipe)
    end

    it 'should install the correct packages' do
      expect(chef_run).to install_package('mailx')
    end
  end
end
