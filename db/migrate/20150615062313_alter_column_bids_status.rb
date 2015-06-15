class AlterColumnBidsStatus < ActiveRecord::Migration
  def change
  	change_column :bids, :bid_status, :integer
  end
end
