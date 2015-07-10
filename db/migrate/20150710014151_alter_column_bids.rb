class AlterColumnBids < ActiveRecord::Migration
  def change
  	rename_column :bids, :business_owner_id, :buyer_id
  end
end
