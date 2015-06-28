class AlterColumnAuctionsStatus < ActiveRecord::Migration
  def change
  	change_column :auctions, :auction_status, 'integer USING CAST(auction_status AS integer)'
  end
end
