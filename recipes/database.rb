#
# Cookbook Name:: acms
# Recipe:: database
#

include_recipe %w{ mysql::server database::mysql }

acms = node['acms']
mysql = node['mysql']

mysql_connexion = {
  :host => 'localhost',
  :username => 'root',
  :password => mysql['server_root_password']
}

mysql_database_user acms['database']['user'] do
  connection mysql_connexion
  password acms['database']['pass']
  action :create
end

mysql_database acms['database']['name'] do
  connection mysql_connexion
  encoding 'utf8'
  action :create
end

mysql_database_user acms['database']['user'] do
  connection mysql_connexion
  password acms['database']['pass']
  database_name acms['database']['name']
  host 'localhost'
  privileges ["SELECT", "UPDATE", "INSERT", "DELETE", "CREATE", "DROP", "INDEX", "ALTER", "LOCK TABLES"]
  action :grant
end
