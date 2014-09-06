require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'pry'
require_relative './lib/connection'
require_relative './lib/author'
require_relative './lib/post'


after do
  ActiveRecord::Base.connection.close
end

get("/") do
  erb(:index)
end

get("/authors") do 
  # local_var or method
  # Class.method    
  erb(:authors, { locals: { authors: Author.all(), } })
end

get("/authors/new") do
	binding.pry
  erb(:new_author, { locals: { posts: Post.all(), } })
end

get("/posts/new") do

  erb(:new_post, { locals: { authors: Author.all } })
end

post("/posts") do
  post_hash = {
    tag: params["tag"],
    copy: params["copy"],
    author_id: params["author_id"],
    created_at: Time.now
  }

  Post.create(post_hash)
  erb(:posts, { locals: { posts: Post.all() } })
end

post("/subscriber/new") do
 subscriber_hash = {
    name: params["name"],
    email: params["email"],
    phone_number: params["phone_number"]
  }

  Post.create(subscriber_hash)
  erb(:subscribe, { locals: { subscribe: Post.all() } })
end



