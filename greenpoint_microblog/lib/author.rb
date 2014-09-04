require 'active_record'

class Author < ActiveRecord::Base
  def author
    Post.find_by({id: self.post_id})
  end
end