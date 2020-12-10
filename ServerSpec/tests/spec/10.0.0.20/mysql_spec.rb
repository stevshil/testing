require 'spec_helper'

describe package('mariadb-server'), :if => os[:family] == 'redhat' do
  it { should be_installed }
end

describe package('mysql-server'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end

describe package('mariadb'), :if => os[:family] == 'redhat' do
  it { should be_installed }
end

describe service('mariadb'), :if => os[:family] == 'redhat' do
  it { should be_enabled }
  it { should be_running }
end

describe service('mysql'), :if => os[:family] == 'ubuntu' do
  it { should be_enabled }
  it { should be_running }
end

describe port(3306) do
  it { should be_listening }
end

describe port(22) do
  it { should be_listening }
end

describe file('/etc/my.cnf') do
  it { should be_file }
end

describe file('/etc/my.cnf.d') do
  it { should be_directory }
end

describe file('/etc/my.cnf.d/mariadb-server.cnf'), :if => os[:family] == 'redhat' do
  its(:content) { should match /^datadir=/ }
end

describe file('/var/lib/mysql') do
  it { should be_directory }
end

describe group('mysql') do
  it { should exist }
end

describe user('mysql') do
  it { should exist }
end

describe user('mysql') do
  it { should belong_to_group 'mysql' }
end

describe kernel_module('usb') do
  it { should be_loaded }
end

describe interface('eth1') do
  it { should exist }
end

describe interface('eth1') do
  it { should have_ipv4_address("10.0.0.20") }
end
