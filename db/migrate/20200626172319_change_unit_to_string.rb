class ChangeUnitToString < ActiveRecord::Migration[6.0]
  def change
    change_column :portions, :unit, :string
  end
end
