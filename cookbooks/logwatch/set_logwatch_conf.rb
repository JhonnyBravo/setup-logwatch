# set_logwatch_conf.rb
# ~/Templates/logwatch/logwatch.conf.erb -> /etc/logwatch/conf/logwatch.conf

require 'dotenv'
Dotenv.load

USER_NAME=ENV["USER_NAME"]
SRC="/home/#{USER_NAME}/Templates/logwatch/logwatch.conf"
DST="/etc/logwatch/conf/logwatch.conf"

template DST do
  action :create
  mode "644"
  source SRC
end
