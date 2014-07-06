class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.string :title
      t.string :firstpost
      t.references :user, index: true
      t.references :forum, index: true

      t.timestamps
    end
  end
end
