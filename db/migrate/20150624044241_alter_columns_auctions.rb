class AlterColumnsAuctions < ActiveRecord::Migration
  def change
  	add_reference :auctions, :category, references: :categories, index: true
  	add_column :auctions, :longtitude, :float
  	add_column :auctions, :latitude, :float
  	remove_column :auctions, :service_loc
  	remove_column :auctions, :service_loc_type
  	remove_column :auctions, :seller_contact
  end
end
