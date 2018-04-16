# get_ssmtp_conf.rb
# ~/Templates/ssmtp/ssmtp.conf.erb ->  /etc/ssmtp/ssmtp.conf

require 'dotenv'
Dotenv.load

USER_NAME=ENV["USER_NAME"]
SRC="/home/#{USER_NAME}/Templates/ssmtp/ssmtp.conf.erb"
DST="/etc/ssmtp/ssmtp.conf"

template DST do
  action :create
  mode "640"
  source SRC
end
