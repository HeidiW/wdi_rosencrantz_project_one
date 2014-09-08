require 'bundler/setup'
Bundler.require

require_relative './lib/connection'
require_relative './lib/author'
require_relative './lib/post'
require_relative './lib/subscriber'
require_relative './lib/image'


get("/") do
  erb(:index, { locals: { posts: Post.all() } })
end

get("/authors") do 
  # local_var or method
  # Class.method    
  erb(:authors, { locals: { authors: Author.all(), } })
end

get("/authors/:id") do
  author = Author.find(params[:id])
  erb(:author, { locals: { author: author } })
end

get("/authors/:authorhandle/posts") do
  author = Author.find_by({handle: params[:authorhandle]})
  erb(:author, { locals: { author: author } })
end

# get("/authors/new") do
# 	binding.pry
#   erb(:new_author, { locals: { posts: Post.all(), } })
# end

get("/posts/new") do

  erb(:new_post, { locals: { authors: Author.all } })
end

get("/posts/:id") do
  post = Post.find(params[:id])
  erb(:post, { locals: { post: post } })
end

get("/feed") do
  erb(:feed, { locals: { posts: Post.all } })
end

post("/posts") do

  if params["author_id"] == "new"
    name = params["name"]
    handle = params["handle"]
    author = Author.create(name: name, handle: handle)
    author_id = author[:id]
  else
    author_id = params["author_id"]
  end

  post_hash = {
    tag: params["tag"],
    headline: params["headline"],
    copy: params["copy"],
    author_id: author_id,
    image: params["image"],
    created_at: Time.now
  }

  post = Post.create(post_hash)
  erb(:post, { locals: { post: post } })
end

post("/posts/:id") do 
  post = Post.find(params[:id])
  tag = params[:tag]
  post.update(tag: tag)
  @tag_updated = true
  erb(:post, { locals: { post: post } })
end

post("/subscribe") do
 subscriber_hash = {
    name: params["name"],
    email: params["email"],
    phone_number: params["phone_number"]
  }

  subscriber = Subscriber.create(name: name, email: email, phone_number: phone_number)
  erb(:subcribe, { locals: { subscriber: subscriber } })
end

get("/images") do
  image = Post.image(params[:id])
  tag = params[:tag]
  post_id = params[:post_id]
  erb(:image, { locals: { post: post } }) 
end 

get("/subscribe") do
  erb(:subscribe) 
end 

get("/about") do
  erb(:about) 
end 


