class CreateUniversityDepartment < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :university, :string
    add_column :users, :department, :string
  end
end
