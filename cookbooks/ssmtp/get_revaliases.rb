# get_revaliases.rb
# /etc/ssmtp/revaliases -> ~/Templates/ssmtp/revaliases.erb

require 'dotenv'
Dotenv.load

USER_NAME=ENV["USER_NAME"]
SRC="/etc/ssmtp/revaliases"
DST="/home/#{USER_NAME}/Templates/ssmtp/"

directory DST do
  action :create
  user USER_NAME
  owner USER_NAME
  group USER_NAME
end

template "#{DST}revaliases.erb" do
  action :create
  user USER_NAME
  owner USER_NAME
  group USER_NAME
  mode "644"
  source SRC
end
