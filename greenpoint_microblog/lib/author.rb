require 'active_record'
require 'pg'

class Author < ActiveRecord::Base
  def posts
    Post.where({author_id: self.id})
  end
end