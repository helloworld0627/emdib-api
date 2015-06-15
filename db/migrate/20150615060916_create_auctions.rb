class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.string :auction_title
      t.string :auction_status
      t.string :auction_desc
      t.decimal :auction_start_price
      t.decimal :auction_end_price
      t.datetime :auction_start_date
      t.datetime :auction_end_date
      t.string :service_loc
      t.string :service_loc_type
      t.string :seller_contact
      t.references :seller, index: true, foreign_key: true, class_name: "User"

      t.timestamps null: false
    end
  end
end
