class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.references :user, index: true, foreign_key: true
      t.references :auction, index: true, foreign_key: true
      t.boolean :private

      t.timestamps null: false
    end
  end
end
