require 'active_record'
require 'pg'

class Subscriber < ActiveRecord::Base
  def subscriber
    Subcriber.find_by({id: self.subscriber_id})
  end

  #Twilio messaging

post = Post.new(content: "yip yip yip", catagory_id: 3, user_id: 2)   
post.save # save to db 
post.reload

subscriptions = Subscription.where(catagory_id: post.catagory_id)  

subscribed_users = subscriptions.map do |subscription|
	User.find_by_id subscriptions.user_id 
end 

  account_sid = AC07783033c88b90e408a1fe7f640e92eb
  auth_token = 57f48f3d65d72309c1dba369e993c754

  @client = Twilio::REST::Client.new account_sid, auth_token

  @client.messages.create(
  :from => '+14159341234',
  :to => '+16105557069',
  :body => 'Hey there!'
)

   # reload from db so we can access the id given by sql 

end