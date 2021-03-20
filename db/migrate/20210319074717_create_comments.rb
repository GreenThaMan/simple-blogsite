class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :author
      t.text :body
      t.integer :pID
      t.timestamps
    end
  end
end
