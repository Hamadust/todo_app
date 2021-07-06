class AddStateAndLimitToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :state, :string
    add_column :tasks, :limit, :date
  end
end
