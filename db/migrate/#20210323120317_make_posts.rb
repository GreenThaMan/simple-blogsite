class MakePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :author
      t.text :body
      t.integer :views
      t.integer :comments

      t.timestamps
    end
  end
end