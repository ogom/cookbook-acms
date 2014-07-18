#
# Cookbook Name:: acms
# Recipe:: ioncube
#

remote_file "#{Chef::Config['file_cache_path']}/ioncube_loaders_lin_x86-64.tar.gz" do
  source "http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz"
  mode 0644
  not_if "test -f #{Chef::Config['file_cache_path']}/ioncube_loaders_lin_x86-64.tar.gz"
end

execute "Extracting and Building ionCube from Source" do
  command <<-EOS
    tar xvfz ioncube_loaders_lin_x86-64.tar.gz
    mv ioncube /usr/local/ioncube
  EOS
  cwd Chef::Config['file_cache_path']
  not_if "test -d /usr/local/ioncube"
end


case node["platform"]
when "debian", "ubuntu"
  ioncube_ini = "/etc/php5/conf.d/ioncube.ini"
when "centos", "redhat", "scientific", "fedora", "amazon", "oracle"
  ioncube_ini = "/etc/php.d/ioncube.ini"
end

file ioncube_ini do
  content "zend_extension=/usr/local/ioncube/ioncube_loader_lin_5.3.so"
  not_if "test -f #{ioncube_ini}"
end

service "apache2" do
  action :restart
end
