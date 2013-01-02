class CreatePages < ActiveRecord::Migration
  def up
    create_table :pages do |t|
        t.string :url
        t.text :content
        t.string :author
        t.timestamps
    end

    add_index :pages, :url
    add_index :pages, :author
    add_index :pages, :created_at
    add_index :pages, :updated_at
  end

  def down
    remove_index :pages, :url
    remove_index :pages, :author
    remove_index :pages, :created_at
    remove_index :pages, :updated_at

    drop_table :pages
  end
end
