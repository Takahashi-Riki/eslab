class AddPostIdRemoveCompanyIdFromComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :post_id, :integer
    remove_column :comments, :company_id, :integer
  end
end
