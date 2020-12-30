class AddYearDeadlineMonthDeadlineDayDeadlineRemoveDeadlineToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :year_deadline, :integer
    add_column :posts, :month_deadline, :integer
    add_column :posts, :day_deadline, :integer
    remove_column :posts, :deadline, :string
  end
end
