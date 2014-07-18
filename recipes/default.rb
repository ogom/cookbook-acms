#
# Cookbook Name:: acms
# Recipe:: default
#
# Copyright (C) 2014 ogom
#
# All rights reserved - Do Not Redistribute
#

include_recipe %w{ apt } if platform?("ubuntu", "debian")
include_recipe %w{ apache2 apache2::mod_php5 apache2::mod_rewrite }
include_recipe %w{ php php::module_mysql php::module_gd }

if platform?("centos", "redhat", "scientific", "fedora", "amazon", "oracle")
  package 'php-mbstring' do
    action :install
  end
end

package 'unzip'
include_recipe %w{ acms::ioncube acms::database acms::install }
