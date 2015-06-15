class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.decimal :bid_price
      t.string :bid_status
      t.references :auction, index: true, foreign_key: true
      t.references :business_owner, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
