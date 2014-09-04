require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/connection'


after do
  ActiveRecord::Base.connection.close
end

get("/") do
  erb(:index)
end



