class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :deadline
      t.string :content
      t.string :password
      t.integer :company_id

      t.timestamps
    end
  end
end
