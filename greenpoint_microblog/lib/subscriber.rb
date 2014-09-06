require 'active_record'
require 'pg'

class Subscriber < ActiveRecord::Base
  def subscriber
    Subcriber.find_by({id: self.subscriber_id})
  end
end