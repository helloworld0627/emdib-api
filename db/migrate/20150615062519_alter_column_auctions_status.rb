class AlterColumnAuctionsStatus < ActiveRecord::Migration
  def change
  	change_column :auctions, :auction_status, :integer
  end
end
