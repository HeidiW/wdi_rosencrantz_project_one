require 'active_record'
require 'pg'

class Author < ActiveRecord::Base
  def post
    Post.find_by({id: self.post_id})
  end
end