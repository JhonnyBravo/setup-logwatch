# get_ssmtp_conf.rb
# /etc/ssmtp/ssmtp.conf -> ~/Templates/ssmtp/ssmtp.conf.erb

require 'dotenv'
Dotenv.load

USER_NAME=ENV["USER_NAME"]
SRC="/etc/ssmtp/ssmtp.conf"
DST="/home/#{USER_NAME}/Templates/ssmtp/"

directory DST do
  action :create
  user USER_NAME
  owner USER_NAME
  group USER_NAME
end

template "#{DST}ssmtp.conf.erb" do
  action :create
  user USER_NAME
  owner USER_NAME
  group USER_NAME
  mode "644"
  source SRC
end
