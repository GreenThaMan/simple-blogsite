class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :author
      t.integer :views
      t.integer :comments

      t.timestamps
    end
  end
end