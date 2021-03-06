#
# Cookbook Name:: learn_chef_httpd
# Recipe:: default
#
# Copyright (C) 2014
#
#
#
package 'httpd' do
  action :install
end

service 'httpd' do
  action [:enable, :start]
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
  mode '0644'
end

service 'iptables' do
  action :stop
end

execute 'disable SElinux' do
  command "sed -i 's/enforcing/disabled/g' /etc/selinux/config /etc/selinux/config"
end
