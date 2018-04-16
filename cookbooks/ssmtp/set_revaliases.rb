# set_revaliases.rb
# ~/Templates/ssmtp/revaliases.erb ->  /etc/ssmtp/revaliases

require 'dotenv'
Dotenv.load

USER_NAME=ENV["USER_NAME"]
SRC="/home/#{USER_NAME}/Templates/ssmtp/revaliases.erb"
DST="/etc/ssmtp/revaliases"

template DST do
  action :create
  mode "644"
  source SRC
end
