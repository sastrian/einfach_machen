class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :body
      t.references :discussion, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
