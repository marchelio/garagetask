class AddDeadAndDoneToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :done, :boolean, default: false
    add_column :tasks, :deadline, :datatime
  end
end
