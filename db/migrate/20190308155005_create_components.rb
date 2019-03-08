class CreateComponents < ActiveRecord::Migration[5.1]
  def change
    create_table :components do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
      t.string :title

      t.timestamps
    end
  end
end
