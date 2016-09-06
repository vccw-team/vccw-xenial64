require 'spec_helper'

describe package('apache2') do
  it { should be_installed }
end

describe service('apache2') do
  it { should be_enabled }
  it { should be_running }
end

describe port(80) do
  it { should be_listening }
end

describe package('mysql-server') do
  it { should be_installed }
end

describe service('mysql') do
  it { should be_enabled }
  it { should be_running }
end

describe port(3306) do
  it { should be_listening }
end

describe command('echo "show databases;" | mysql -uroot -pwordpress') do
  let(:disable_sudo) { true }
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match /information_schema/ }
end

describe command('php -v') do
  let(:disable_sudo) { true }
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match /PHP 7\./ }
end

describe command('node -v') do
  let(:disable_sudo) { true }
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match /v6\.5\.0/ }
end

describe command('ruby -v') do
  let(:disable_sudo) { true }
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match /ruby 2\.3\./ }
end

describe user('vagrant') do
  it { should exist }
  it { should belong_to_group 'ubuntu' }
  it { should have_login_shell '/bin/bash' }
  it { should have_authorized_key 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key' }
end

describe user('ubuntu') do
  it { should exist }
  it { should have_login_shell '/bin/false' }
end

describe file('/etc/ssh/sshd_config') do
  it { should be_file }
  it { should contain "PasswordAuthentication no" }
end
