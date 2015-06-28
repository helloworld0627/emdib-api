class DropBusinessOwners < ActiveRecord::Migration
  def change
  	remove_reference :bids, :business_owner
  	drop_table :business_owners
  	add_reference :bids, :business_owner, references: :users, index: true
  end
end
