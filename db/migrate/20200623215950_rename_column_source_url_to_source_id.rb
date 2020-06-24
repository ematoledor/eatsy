class RenameColumnSourceUrlToSourceId < ActiveRecord::Migration[6.0]
  def change
    rename_column :recipes, :source_url, :source_id
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
