class RenameRememberTitleColumnToBooks < ActiveRecord::Migration[5.2]
  def change
    rename_column :books, :remember_title, :title
  end
end
