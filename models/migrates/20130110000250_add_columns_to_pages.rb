class AddColumnsToPages < ActiveRecord::Migration
  def up
    add_column :pages, :title, :string
    add_column :pages, :description, :string, lenght: 500
  end

  def down
    remove_column :pages, :title
    remove_column :pages, :description
  end
end