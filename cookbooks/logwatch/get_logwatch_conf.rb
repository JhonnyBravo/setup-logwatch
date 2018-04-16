# get_logwatch_conf.rb
# {
#   /etc/logwatch/conf/logwatch.conf,
#   /usr/share/logwatch/default.conf/logwatch.conf
# } -> ~/Templates/logwatch/logwatch.conf.erb

require 'dotenv'
Dotenv.load

USER_NAME=ENV["USER_NAME"]
SRC1="/etc/logwatch/conf/logwatch.conf"
SRC2="/usr/share/logwatch/default.conf/logwatch.conf"
DST="/home/#{USER_NAME}/Templates/logwatch/"

directory DST do
  action :create
  user USER_NAME
  owner USER_NAME
  group USER_NAME
end

execute "get_logwatch_conf_from_usr" do
  not_if "test -f #{SRC1}"
  user USER_NAME
  command "install -m 644 #{SRC2} #{DST}logwatch.conf.erb"
end

execute "get_logwatch_conf_from_etc" do
  only_if "test -f #{SRC1}"
  user USER_NAME
  command "install -m 644 #{SRC1} #{DST}logwatch.conf.erb"
end
