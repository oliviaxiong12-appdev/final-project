class AddAmountToComponents < ActiveRecord::Migration[5.1]
  def change
    add_column :components, :amount, :string
  end
end
