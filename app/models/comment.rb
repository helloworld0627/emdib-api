class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :auction

  validates_length_of :content, :maximum => 1024, :allow_blank => false
end
