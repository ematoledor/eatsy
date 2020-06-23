class ChangeDiaryToDairy < ActiveRecord::Migration[6.0]
  def change
    rename_column :recipes, :diary_free, :dairy_free
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
