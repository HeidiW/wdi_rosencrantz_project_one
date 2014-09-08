require 'active_record'
require 'pg'

class Post < ActiveRecord::Base
  def author
    Author.find_by({id: self.author_id})
  end
   
   def image
    Image.where(post_id: self.id)
  end

end