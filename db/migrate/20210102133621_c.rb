class C < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :if_seen, :boolean, default: false, null: false
  end
end