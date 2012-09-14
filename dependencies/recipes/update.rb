#
# Cookbook Name:: dependencies
# Recipe:: update
#

include_recipe "packages"
include_recipe "gem_support"

case node[:platform]
when "centos", "redhat", "fedora", "suse", "amazon"
  if node[:dependencies][:upgrade_rpms]
    execute "yum -y update" do
      command "yum -y update"
      action :run
    end
  end
when "debian", "ubuntu"
  if node[:dependencies][:update_debs]
    execute "apt-get update" do
      command "apt-get update"
      action :run
    end
  end

  if node[:dependencies][:upgrade_debs]
    execute "apt-get upgrade" do
      command "apt-get upgrade -y"
      action :run
    end
  end
end

if node[:dependencies][:upgrade_gems]
  execute "gem update" do
    command "gem update"
    action :run
  end
end
