require 'active_record'

ActiveRecord::Base.establish_connection({
  :adapter => "postgresql",
  :host => "localhost",
  :username => "heidiwilliams",
  :database => "greenpoint_microblog"
})

ActiveRecord::Base.logger = Logger.new(STDOUT)