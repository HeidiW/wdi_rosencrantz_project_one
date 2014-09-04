require 'active_record'

class Post < ActiveRecord::Base
  def post
    Author.find_by({id: self.author_id})
  end
end