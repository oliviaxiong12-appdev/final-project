class CreatePantries < ActiveRecord::Migration[5.1]
  def change
    create_table :pantries do |t|
      t.integer :user_id
      t.integer :ingredient_id

      t.timestamps
    end
  end
end
