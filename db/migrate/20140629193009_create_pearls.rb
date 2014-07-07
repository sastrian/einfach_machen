class CreatePearls < ActiveRecord::Migration
  def change
    create_table :pearls do |t|
      t.references :user, index: true
      t.text :body
      t.string :title
      t.string :image

      t.timestamps
    end
  end
end
