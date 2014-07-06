class AddSlugToForums < ActiveRecord::Migration
  def change
    add_column :forums, :slug, :string    
    add_index :forums, :slug
  end
end
