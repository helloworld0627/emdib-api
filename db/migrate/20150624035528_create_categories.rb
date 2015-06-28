class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      #t.references :parent, index: true, foreign_key: true, class_name: "Category"

      t.timestamps null: false
    end

    add_reference :categories, :parent, references: :categories, index: true
 
  end
end
