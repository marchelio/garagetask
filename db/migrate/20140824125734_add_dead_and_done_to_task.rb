class AddDeadAndDoneToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :done, :boolean, defoult: false
    add_column :tasks, :deadline, :datatime
  end
end
