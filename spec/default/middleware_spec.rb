require 'spec_helper'

describe package('apache2') do
  it { should be_installed }
end

describe service('apache2') do
  it { should be_enabled }
  it { should be_running }
end

describe command('apache2ctl -M') do
    its(:exit_status) { should eq 0 }
    its(:stdout) { should match /rewrite_module/ }
    its(:stdout) { should match /ssl_module/ }
end

describe port(80) do
  it { should be_listening }
end

describe port(443) do
  it { should be_listening }
end

describe package('mysql-server') do
  it { should be_installed }
end

# describe service('mysql') do
#   it { should be_enabled }
#   it { should be_running }
# end
#
# describe port(3306) do
#   it { should be_listening }
# end
#
# describe command('echo "show databases;" | mysql -uroot -pwordpress') do
#   let(:disable_sudo) { true }
#   its(:exit_status) { should eq 0 }
#   its(:stdout) { should match /information_schema/ }
# end

describe command('php -v') do
  let(:disable_sudo) { true }
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match /PHP 7\./ }
end

describe command('node -v') do
  let(:disable_sudo) { true }
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match /v12\./ }
end

describe command('ruby -v') do
  let(:disable_sudo) { true }
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match /ruby 2\./ }
end

packages = %w{
  git
  build-essential
  ruby-dev
  libsqlite3-dev
  jq
  subversion
  curl
  gettext
  python-mysqldb
  imagemagick
  php7.4
  libapache2-mod-php7.4
  php7.4-cli
  php7.4-dev
  php7.4-mbstring
  php7.4-mcrypt
  php7.4-mysql
  php7.4-gd
  php7.4-curl
  php7.4-zip
  php-xdebug
  php-imagick
}

packages.each do |package|
  describe package(package) do
    it { should be_installed }
  end
end

commands = %w{
  curl
  gettext
  git
  jq
  msgfmt
  msgmerge
  svn
  convert
}

commands.each do |command|
  describe command("which " + Shellwords.shellescape(command)) do
    let(:disable_sudo) { true }
    its(:exit_status) { should eq 0 }
  end
end
