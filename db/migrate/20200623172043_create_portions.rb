class CreatePortions < ActiveRecord::Migration[6.0]
  def change
    create_table :portions do |t|
      t.integer :unit
      t.integer :amount
      t.string :friendly_description
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
