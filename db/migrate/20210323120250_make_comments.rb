class MakeComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :author
      t.text :body
      t.references :post, index:true, foreign_key: true
      t.timestamps
    end
  end
end
