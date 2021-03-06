require 'spec_helper'
describe 'profiles::puppet::foreman' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) { facts }
      let(:pre_condition) { 'include ::profiles::database::postgresql' }

      context 'with defaults for all parameters' do
        it { is_expected.to contain_class('profiles::puppet::foreman') }
      end
    end
  end
end
