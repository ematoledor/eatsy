class ChangeAmountToString < ActiveRecord::Migration[6.0]
  def change
    change_column :portions, :amount, :string
  end
end
