require 'active_record'

class Post < ActiveRecord::Base
  def author
    Author.find_by({id: self.author_id})
  end
end