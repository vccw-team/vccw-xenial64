require 'serverspec'
require 'docker'

# require 'net/ssh'
# require 'tempfile'

# set :backend, :ssh

# host = "default"

# config = Tempfile.new('', Dir.tmpdir)
# `unset RUBYLIB; vagrant ssh-config #{host} > #{config.path}`

# options = Net::SSH::Config.for(host, [config.path])
# puts options.to_s
# set :host,        host
# set :ssh_options, options

set :backend, :docker
set :docker_url, 'unix:///var/run/docker.sock'
set :docker_container, 'vccw-test'

# TODO https://github.com/swipely/docker-api/issues/202
Excon.defaults[:ssl_verify_peer] = false
