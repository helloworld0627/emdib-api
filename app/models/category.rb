class Category < ActiveRecord::Base
  belongs_to :parent, class_name: "Category"
  has_many :categories
  has_many :auctions

  validates_length_of :name, :maximum => 256, :allow_blank => false
end
