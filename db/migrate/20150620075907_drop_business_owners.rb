class DropBusinessOwners < ActiveRecord::Migration
  def change
  	drop_table :business_owners
  	remove_reference :bids, :business_owner
  	add_reference :bids, :business_owner, references: :users, index: true
  end
end
