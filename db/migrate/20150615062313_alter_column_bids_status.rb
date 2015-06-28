class AlterColumnBidsStatus < ActiveRecord::Migration
  def change
  	change_column :bids, :bid_status, 'integer USING CAST(bid_status AS integer)'
  end
end
