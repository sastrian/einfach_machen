class AddSlugToPearls < ActiveRecord::Migration
  def change
    add_column :pearls, :slug, :string
    add_index :pearls, :slug
  end
end
