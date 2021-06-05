class RenameRememberBodyColumnToBooks < ActiveRecord::Migration[5.2]
  def change
    rename_column :books, :remember_body, :body
  end
end
