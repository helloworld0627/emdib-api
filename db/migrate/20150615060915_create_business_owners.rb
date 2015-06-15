class CreateBusinessOwners < ActiveRecord::Migration
  def change
    create_table :business_owners do |t|
      t.string :client_id
      t.string :yelp_url

      t.timestamps null: false
    end
  end
end
